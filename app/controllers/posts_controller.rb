class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Good stuff! Good stuff!"
      redirect_to posts_path
    else
      flash[:alert] = "Oh no, something went wrong!"
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :description)
  end

end
