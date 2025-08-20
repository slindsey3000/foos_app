class SessionsController < ApplicationController
  def new
    # Show sign in form
  end

  def create
    # Try to find user by email or phone (case insensitive)
    login_field = params[:email_or_phone]&.strip&.downcase
    
    if login_field.blank?
      flash.now[:alert] = 'Please enter an email address or phone number.'
      render :new and return
    end
    
    # Clean phone number for comparison (remove non-digits)
    clean_phone = login_field.gsub(/\D/, '')
    
    user = User.where("LOWER(email) = ? OR REPLACE(phone, ' ', '') = ? OR REPLACE(REPLACE(REPLACE(REPLACE(phone, '-', ''), '(', ''), ')', ''), ' ', '') = ?", 
                     login_field, clean_phone, clean_phone).first
    
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
        flash.now[:alert] = 'Email or phone number not found. Please check your credentials or sign up for an account.'
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
