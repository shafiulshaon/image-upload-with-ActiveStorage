module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(user_id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def authorize_login
    redirect_to root_path unless logged_in?
  end

  def oauth_uri
    {
      authorization_uri: ENV['UNIFA_OAUTH_URI'] || 'http://unifa-recruit-my-tweet-app.ap-northeast-1.elasticbeanstalk.com/oauth/authorize',
      access_token_uri: ENV['UNIFA_RESPONSE_URI'] || 'http://unifa-recruit-my-tweet-app.ap-northeast-1.elasticbeanstalk.com/oauth/token',
      tweet_uri: ENV['UNIFA_TWEET_URI'] || 'http://unifa-recruit-my-tweet-app.ap-northeast-1.elasticbeanstalk.com/api/tweets',
    }
  end

  def oauth_params
    {
      client_id: ENV['UNIFA_OAUTH_CLIENT_ID'] || 'g6-zCw8r8VzF9DRwuxCBPZKjhqmfbzk0Jhn6Ez3Kaas',
      client_secret: ENV['UNIFA_OAUTH_CLIENT_SECRET'] || 'QhZ7PAexuVv1SmaHxT3AqVI5IMMj_Skbl1uJv89oUus',
      redirect_uri: ENV['UNIFA_REDIRECT_URI'] || 'http://localhost:3000/oauth/callback',
      response_type: 'code',
      grant_type: 'authorization_code',
      scope: 'write_tweet',
      state: nil
    }
  end
end
