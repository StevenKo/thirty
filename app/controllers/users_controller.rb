class UsersController < ApplicationController
  def show
    @clips = Clip.all
  end
end
