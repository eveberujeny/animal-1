class UsersController < ApplicationController

  def index
    @animals = Animal.where(user_id: current_user.id)
  end

end
