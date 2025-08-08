class SessionsController < ApplicationController
  def new
    # Show sign in form
  end

  def create
    user = User.find_by(username: params[:username])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      
      if user.admin?
        redirect_to admin_dashboard_path, notice: 'Welcome Admin!'
      else
        redirect_to root_path, notice: 'Signed in successfully!'
      end
    else
      flash.now[:alert] = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Signed out successfully!'
  end
end
