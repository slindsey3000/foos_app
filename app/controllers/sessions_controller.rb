class SessionsController < ApplicationController
  def new
    # Show sign in form
  end

  def create
    # Try to find user by username or email (case insensitive)
    login_field = params[:username]&.strip&.downcase
    
    if login_field.blank?
      flash.now[:alert] = 'Please enter a username or email address.'
      render :new and return
    end
    
    user = User.where("LOWER(username) = ? OR LOWER(email) = ?", login_field, login_field).first
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      
      if user.admin?
        redirect_to admin_dashboard_path, notice: 'Welcome Admin!'
      else
        redirect_to root_path, notice: 'Signed in successfully!'
      end
    else
      # Provide specific feedback for better user experience
      if user.nil?
        flash.now[:alert] = 'Username or email not found. Please check your credentials or sign up for an account.'
      else
        flash.now[:alert] = 'Incorrect password. Please try again.'
      end
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Signed out successfully!'
  end
end
