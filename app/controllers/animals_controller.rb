class AnimalsController < ApplicationController
  before_action :search_animal, only: [:index, :search]

  def index
    @animals = Animal.includes(:user)
    @tweets = Tweet.includes(:user)
    set_animal_column
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to root_path     
    else
      render :new
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @tweet = @animal.tweets.includes(:user)

    @animals = Animal.includes(:user)

  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to animal_path
    else
      render :edit
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to root_path
  end

  def search 
    @results = @p.result.includes(:user)
  end

  private
  def animal_params
    params.require(:animal).permit(:animal_name, :animal_type_id, :animal_pedigree, :birthday, :introduction, :image, :likes_count).merge(user_id: current_user.id)
  end

  def search_animal
    @p = Animal.ransack(params[:q])
  end

  def set_animal_column
    @animal_name = Animal.select("animal_name").distinct
    @animal_pedigree = Animal.select("animal_pedigree").distinct
  end


end
