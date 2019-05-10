class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
      flash[:success] = "create post success" 
    else
      render :new 
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
      flash[:success] = "update post success" 
    else
      render :edit 
    end
  end

  def destroy
    @post.destroy
      redirect_to posts_url
      flash[:success] = "Post was successfully destroyed" 
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
