# encoding: utf-8

class ClipsController < ApplicationController
  def update_modal
    @clip = Clip.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def tv
  end


  def search
    @clips = Clip.search(params)
  end

  def add_collect
    @clip = Clip.find(params[:id])     
    current_user.collect_clips << @clip
    @btn_text = "已收藏"
    @btn_class = "btn btn-danger"
    respond_to do |format|
      format.js
    end
  end

  def remove_collect
    @clip = Clip.find(params[:id])
    current_user.collect_clips.delete @clip
    @btn_text = "收藏"
    @btn_class = "btn btn-success"
    respond_to do |format|
      format.js
    end
  end

  def new
    @clip = Clip.new
    @tags = Clip.tag_counts_on(:cagtegory) + Clip.tag_counts_on(:tags)
  end

  def create
    @clip = Clip.new(params[:clip])
    @clip.tag_list = params[:text][:tag_area]
    @clip.video_id = Clip.parse_video_id params[:clip][:url]

    if @clip.save
      redirect_to root_path
    else
      render :action => :new
    end
    # redirect_to board_topic_path(@topic.board,@topic)
  end

  def add_tag
    @tag = params[:tag]
    respond_to do |format|
      format.js
    end
  end

  def show
    @clip = Clip.find(params[:id])
    @recomment_clips = Clip.all
  end

  def rate
    rate = current_user.user_rated_clips.build
    rate.rating = params[:rating]
    rate.clip_id = params[:clip_id]
    rate.save
    respond_to do |format|
      format.js
    end
  end

  def preload_left_video
    @clip = Clip.find(rand(Clip.count))
  end

  def preload_right_video
    @clip = Clip.find(rand(Clip.count))
  end

  def popular
    @clips = Clip.popular.paginate(:per_page => 10, :page => params[:page])
  end

  def latest
    @clips = Clip.by_date.paginate(:per_page => 10, :page => params[:page])
  end
end
