class MessagesController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @message = @tweet.messages.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end

  private
  def message_params
    params.require(:message).permit(:message_text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
