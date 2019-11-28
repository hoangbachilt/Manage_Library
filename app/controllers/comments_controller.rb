class CommentsController < ApplicationController
	 before_action :user_signed?

  def create
    @comment = current_user.comments.new(comment_params)
    @book = @comment.book
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.book, notice: "Comment was successfully created." }
        format.js
        # format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to @comment.book, alert: @comment.errors.full_messages.first}
        # format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update_attributes(comment_params)
        format.html { redirect_to @comment.book, notice: "Comment was successfully updated." }
      else
        format.html { redirect_to @comment.book, alert: @comment.errors.full_messages.first}
      end
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:parent_id, :book_id, :user_id, :content)
  end

  def user_signed?
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
