class WelcomeController < ApplicationController
  def index
    @clips = Clip.paginate(:per_page => 10, :page => params[:page])
    @tags = Clip.tag_counts_on(:tags)
  end

end
