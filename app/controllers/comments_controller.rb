class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @record = Record.find(params[:record_id])
    @comment = @record.comments.build(comment_params)
    @comment.user = current_user
    @comment.created_at = Date.today

    if @comment.save
      redirect_to land_record_path(@record.land, @record)
    else
      redirect_to land_record_path(@record.land, @record), alert: "Nem sikerült elküldeni a hozzászólást."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
