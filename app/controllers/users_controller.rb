class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = user.new(user_params)

    if @user.save
      render json: { user: @user, status: :created }
    else
      render json: { errors: @user.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @user.update(user_params)
      render json: { user: @user, status: :ok }
    else
      render json: { errors: @user.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @user.destroy

    render nothing: true
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:name, :password)
    end
end
