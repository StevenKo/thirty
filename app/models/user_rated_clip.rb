class UserRatedClip < ActiveRecord::Base
  belongs_to :user
  belongs_to :clip
end
