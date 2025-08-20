class Admin::UsersController < ApplicationController
  before_action :require_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.order(:lastname, :firstname)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to admin_user_path(@user), notice: 'User was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'User was successfully deleted.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    permitted_params = [:username, :email, :password, :password_confirmation, 
                       :firstname, :lastname, :phone, :address, :city, :state, :zip_code,
                       :level, :about, :image_url, :director_title]
    
    # Only allow admins to set admin, director, and world_cup_selection_committee fields
    if current_user&.admin?
      permitted_params += [:admin, :director, :world_cup_selection_committee]
    end
    
    params.require(:user).permit(permitted_params)
  end
end
