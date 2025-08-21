class DashboardController < ApplicationController
  before_action :require_user

  def index
    @user = current_user
    @recent_activity = [] # Placeholder for future activity tracking
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(user_params)
      redirect_to dashboard_path, notice: "Profile updated successfully!"
    else
      render :edit_profile, status: :unprocessable_entity
    end
  end

  def change_password
    @user = current_user
  end

  def update_password
    @user = current_user
    if @user.authenticate(params[:user][:current_password])
      if @user.update(password_params)
        redirect_to dashboard_path, notice: "Password updated successfully!"
      else
        render :change_password, status: :unprocessable_entity
      end
    else
      @user.errors.add(:current_password, "is incorrect")
      render :change_password, status: :unprocessable_entity
    end
  end

  private

  def require_user
    unless current_user
      redirect_to signin_path, alert: "Please sign in to access your dashboard."
    end
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :phone, :address, :city, :state, :zip_code, :level)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end 