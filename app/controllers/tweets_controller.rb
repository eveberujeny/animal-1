class TweetsController < ApplicationController
  
  def index
    @tweet = Tweet.includes(:animal_id)
    @tweets = Tweet.new

  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @tweet = Tweet.find(params[:animal_id])
    @message = Message.new
    @messages = @tweet.messages.includes(:user)
  end

  def destroy
    @tweet = Tweet.find(params[:animal_id])
    @tweet.destroy
    redirect_to root_path
  end


  private

  def tweet_params  
    params.require(:tweet).permit(:title, :text, :food_image).merge(user_id: current_user.id, animal_id: params[:animal_id])
  end
end
