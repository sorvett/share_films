class UsersController < ApplicationController

  def index
      @user = current_user
      @users = User.all
      @blogs = Blog.all
  end

  def new

  end

  def show
      @user = User.find(params[:id])
      @blog = @user.blogs
      @blog = Blog.new
  end

  def edit

  end

  def update
      @user = User.find(params[:id])
      if @user.update(users_params)
         redirect_to user_path(@user) ,notice: 'You have updated user successfully.'
      else
      render :edit
      end
  end

end
