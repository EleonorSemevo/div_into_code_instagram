class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    #@post = Post.new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "post is successfully created"
      else
        render :new
      end
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    #respond_to do |format|
      # format.html {
        redirect_to posts_url, notice: "Post was successfully destroyed."
      # }
      # format.json { head :no_content }
    #end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :image, :image_cache)
  end
end
