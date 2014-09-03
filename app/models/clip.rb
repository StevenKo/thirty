class Clip < ActiveRecord::Base
  
  acts_as_taggable_on :tags,:category
  

  has_many :user_collect_clips
  has_many :clip_collect_by_users, :through => :user_collect_clips, :source => :user

  has_many :user_rated_clips
  has_many :rated_by_users, :through => :user_rated_clips, :source => :user

  scope :popular, where('is_hot = ?', 1).order('updated_at DESC')
  scope :by_date, order('created_at DESC') 

  auto_html_for :url do
    html_escape
    image
    youtube(:width => 640, :height => 400)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

  # search
  include Tire::Model::Search
  include Tire::Model::Callbacks

  mapping do
    indexes :id, type: 'integer'
    indexes :title
    indexes :discription
    indexes :tag_name
    indexes :category_name
  end

  def self.search(params)
    tire.search(load: true) do
      query { string params[:search] } if params[:search].present?
    end
  end


  self.include_root_in_json = false
  def to_indexed_json
    to_json(methods: [:tag_name])
  end

  def tag_name
    tags.join(" "){|t| t.name}
  end

  def category_name
    category.join(" "){|t| t.name}
  end

  def self.parse_video_id url
    %r|http://www.youtube.com/watch\?v=(.*)| =~ url
    $1[0..10]
  end
end
