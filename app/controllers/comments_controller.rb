class CommentsController < ApplicationController
  before_action :authenticate_author!, except: [:show, :index]
  before_action :set_post
  before_action :ensure_author, only: [:destroy]

  def index
    @comments = @post.comments
  end

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_url(@post), notice: 'Comment added!'
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_url(@post), notice: 'Comment deleted.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :body)
  end

  def ensure_author
    return if current_author && current_author.id == @post.author_id

    redirect_back(fallback_location: post_url(@post), notice: 'Only the author can delete comments.')
  end
end
