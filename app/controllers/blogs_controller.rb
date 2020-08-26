class BlogsController < ApplicationController
  def index
      @blogs = Blog.all
      @blog = Blog.new
  end

  def new
      @blog = Blog.new
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
      @blog = Blog.find(params[:id])
      @user = User.find(@blog.user_id)
      @comment = BlogComment.new
      @blog_comments = @blog.blog_comments
  end

  def edit
      @blog = Blog.find(params[:id])
      if current_user!= @blog.user
      redirect_to blog_path
      end
  end

  def update
      @blog = Blog.find(params[:id])
      if @blog.update(blog_params)
         redirect_to blog_path(@blog) ,notice: 'Blog was successfully updated.'
      else
         render 'edit'
      end
  end

  def destroy
  end

  private
    def blog_params
        params.require(:blog).permit(:title, :body, :image)
    end
end
