class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user 
      log_in_user!(@user)
    else 
      flash.now[:errors] = ["Invalid credentials. Try again."]
      render :new 
    end
  end

  def destroy
    current_user.session_token = SecureRandom::urlsafe_base64
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
