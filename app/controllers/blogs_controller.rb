class BlogsController < ApplicationController
  def index
      @blogs = Blog.all
      @blog = Blog.new
  end

  def new
  end

  def create
      @blog = Blog.new(blog_params)
      @blog.user_id = current_user.id
      if @blog.save
      redirect_to blog_path(@blog.id), notice: "successfully created blog!"
      else
      @blogs = Blog.all
      render 'index'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
