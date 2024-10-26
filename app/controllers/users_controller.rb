class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  
  def index
    @users = User.all
    render json:{
      message: "Data is available!",
      users: @users,
    }, status: :ok
  end

  def show
    render json:{
      message:"User data found!",
      user: @user,
    }, status: :ok
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      render json:{
        message: "User added successfully!"
      }, status: :ok
    else
      render json:{
        message: @user.errors
      }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json:{
        message: "User details updated successfully!"
      }, status: :ok
    else
      render json:{
        message: @user.errors
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy 
    render json:{
        message: "User deleted successfully!"
      }, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
