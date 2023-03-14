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
  end

  def tweet
  end

end

