class CommentsController < ApplicationController

  def create
    @animal = Animal.find(params[:animal_id])
    @comment = @animal.comments.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text).merge(user_id: current_user.id, animal_id: params[:animal_id])
  end
end
