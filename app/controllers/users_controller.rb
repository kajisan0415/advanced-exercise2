class UsersController < ApplicationController
before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
        render "edit"
    else
        redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end
  
  def followed
    @followed = @user.followed_users
  end

  def followers
    @followers = @user.follower_users
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
