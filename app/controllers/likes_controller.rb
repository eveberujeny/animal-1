class LikesController < ApplicationController
  before_action :set_like

  def create
    like = current_user.likes.new(animal_id: @animal.id)
    like.save
    likes = Like.where(animal_id: @animal.id)
  end

  def destroy
    like = Like.find_by(animal_id: @animal.id, user_id: current_user.id).destroy
    likes = Like.where(animal_id: @animal.id)
  end

  private

  def set_like
    @animal = Animal.find(params[:animal_id])
  end
end

