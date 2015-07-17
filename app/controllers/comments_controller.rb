class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      current_user.comments.push(@comment)
      flash[:notice] = "Now that's a good point."
      respond_to do |format|
        format.html {redirect_to posts_path}
        format.js
      end
    else
      flash[:alert] = "Hmm, looks like something went wrong."
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:description)
  end

end
