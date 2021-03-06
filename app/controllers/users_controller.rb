class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
         @blog = Blog.new(blog_params)
      if @blog.save
         redirect_to blog_path(@blog.id) ,notice: 'Blog was successfully created.'
      else
         @blogs = Blog.all
         render 'show'
      end

  end

  def show
      @user = User.find(params[:id])
      @blogs = @user.blogs
      @blog = Blog.new
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.update(users_params)
         redirect_to user_path(@user) ,notice: 'You have updated user successfully.'
      else
      render :edit
      end
  end

  private
  def users_params
      params.require(:user).permit(:name, :profile_image)
  end

end
