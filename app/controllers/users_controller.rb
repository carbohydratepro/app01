class UsersController < ApplicationController
  before_action :ensure_current_user, {only: [:edit, :update]}
  def ensure_current_user
    if current_user.id == params[:id].to_i
    else
      redirect_to user_path(current_user)
    end
  end
  
  def index
    @booknew = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @book_comment = BookComment.new

  end
  def edit
    @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'User was successfully updated!'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
