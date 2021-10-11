class Relationship < ApplicationRecord
  
  belongs_to :follower, class_name: "EndUser"
  belongs_to :following, class_name: "EndUser"
  validates :follower_id, presence: true
  validates :following_id, presence: true
  
end
