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
end
