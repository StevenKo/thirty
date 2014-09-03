class CategoryController < ApplicationController

  def index
    category = params[:category]
    @clips = Clip.tagged_with(category).paginate(:per_page => 10, :page => params[:page])
  end
end
