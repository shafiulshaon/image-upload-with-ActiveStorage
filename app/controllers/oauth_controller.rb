require 'net/http'

class OauthController < ApplicationController

  def connect
    uri = URI(oauth_uri[:authorization_uri])
    params = {client_id: oauth_params[:client_id],
              response_type: oauth_params[:response_type],
              redirect_uri: oauth_params[:redirect_uri],
              scope: oauth_params[:scope],
              state: oauth_params[:state]}
    uri.query = params.to_query
    redirect_to uri.to_s
  end

  def callback
    if params[:code]
      uri = URI(oauth_uri[:access_token_uri])
      res = Net::HTTP.post_form(uri, {
        code: params[:code],
        client_id: oauth_params[:client_id],
        client_secret: oauth_params[:client_secret],
        redirect_uri: oauth_params[:redirect_uri],
        grant_type: oauth_params[:grant_type]
      })
      if res.is_a?(Net::HTTPSuccess)
        data = JSON.parse(res.body)
        session[:access_token] = data['access_token']
        redirect_to images_path
      else
        flash[:error] = 'Failed to get access token'
        redirect_to images_path
      end
    else
      flash[:error] = 'Missing authorization code'
      redirect_to images_path
    end
  end

  def tweet
  end

end

