class CommentsController < ApplicationController

  def new
  	@comment = Comment.new
  end

  def create 
  	@comment = Comment.create(comment_params)
  	@comment.user = current_user
  	redirect_to root_url
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = "Comment deleted"
    redirect_to root_url
  end

  def upvote 
    @comment = Comment.find(params[:id])
    @comment.upvote_by current_user
    redirect_back fallback_location: root_path
  end  

  def downvote
    @comment = Comment.find(params[:id])
    @comment.downvote_by current_user
    redirect_back fallback_location: root_path
  end

  private 
 
  def comment_params
	  params.require(:comment).permit(:body, :micropost_id, :user_id)
  end

end
