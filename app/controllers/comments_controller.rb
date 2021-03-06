class CommentsController < ApplicationController
  before_action :authenticate_user!


  def create
    # @comment = Comment.new(comment_params.merge(:post_id => params[:post_id]))
    # @comment.save

    # @comment = Post.find(params[:post_id]).comments.create(comment_params)
    # redirect_to post_path(params[:post_id])

    post = Post.find(params[:post_id])
    @comment = post.comments.new(comment_params)
    @comment.user = current_user
    post.comments_time = post.comments.last.created_at
    post.save!

    redirect_to post_path(post)
  end

  protected

  def comment_params
    params.require(:comment).permit(:content)
  end

end
