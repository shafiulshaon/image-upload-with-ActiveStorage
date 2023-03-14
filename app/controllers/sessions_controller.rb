class SessionsController < ApplicationController
  skip_before_action :authorize_login

  def new
    redirect_to images_path if logged_in?
  end

  def create
    @user = User.find_by(user_id: params[:session][:user_id])
    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.user_id
      redirect_to images_path
    else
      @errors = []
      @errors.concat(["ユーザーIDを入力してください"]) if params[:session][:user_id].blank?
      @errors.concat(["パスワードを入力してください"]) if params[:session][:password].blank?
      @errors.concat(['ユーザーIDとパスワードが一致するユーザーが存在しない']) if params[:session][:user_id].present? && params[:session][:password].present?
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:access_token)
    redirect_to login_path
  end

end
