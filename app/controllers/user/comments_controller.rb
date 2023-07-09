class User::CommentsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @comments = current_user.comments.page(params[:page]).per(5)
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      flash[:notice] = 'Comment updated successfully'
      redirect_to post_comments_path(@post)
    else
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find params[:post_id]
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end