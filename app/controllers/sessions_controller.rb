class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = "I failed to login"
      render :new
    end
  end
  def destroy
    # deletes user session
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out'
  end
  private
   def user_params
    params.require(:session).permit(:email, :password)
   end
 end
