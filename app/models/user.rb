class User < ActiveRecord::Base
  extend OmniauthCallbacks

  mount_uploader :avatar, AvatarUploader 
   
  has_many :authorizations

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :user_collect_clips
  has_many :collect_clips, :through => :user_collect_clips, :source => :clip

  has_many :user_rated_clips
  has_many :rated_clips, :through => :user_rated_clips, :source => :clip

  def collect clip
    self.collect_clips.each do |c|
      return true if c == clip
    end
    return false
  end

end
