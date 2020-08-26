class BlogCommentsController < ApplicationController
  
  def create
  	  @blog = Blog.find(params[:id])
  	  comment = current_user.blog_comments.new(blog_comment_params)
  	  comment.blog_id = blog.id
  	  comment.save
  	  redirect_to request.referer
  end

  def destroy
  end

  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end

end
