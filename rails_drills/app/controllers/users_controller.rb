class UsersController < ApplicationController
  before_action :logged_in?, only: [:show, :edit, :index]
  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
    @user = User.create(user_params)
    login(@user)
    redirect_to "/users/#{@user.id}"
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    render :show
  end

  def edit
    @user = current_user
  end

  def update
  end

  def destroy
    @user.destroy()
  end
end
