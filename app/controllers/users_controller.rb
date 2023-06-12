class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_request, except: :create
  def index
    @users = User.all
    render json:@users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: {errors: @user.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

  def destroy
    @user.destroy
  end



  private

  def set_user
    @user = User.find_by_username!(params[:username])
  end

  def user_params
    params.permit( :username, :email, :password)
  end
end
