class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :get_all_users
  def index
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
        message: "User added successfully!",
        users: @users,
      }, status: :ok
    else
      render json:{
        message: @new_user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json:{
        message: "User details updated successfully!",
        users: @users,
      }, status: :ok
    else
      render json:{
        message: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy 
    render json:{
        message: "User deleted successfully!",
        users: @users,
      }, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def get_all_users
    @users = User.all
  end

end
