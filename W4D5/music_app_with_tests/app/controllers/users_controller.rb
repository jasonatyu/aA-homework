class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:session_token] = @user.session_token
      redirect_to bands_url
    else  
      flash.now[:errors] = @user.errors.full_messages
      render :new 
    end 
  end

  def show 
  end 

  private 
  def user_params 
    params.require(:user).permit(:email, :password)
  end

end
