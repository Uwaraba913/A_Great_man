class Quote < ApplicationRecord
  belongs_to :admin, optional: true
  belongs_to :end_user, optional: true
  belongs_to :person_profile, optional: true
  has_many :categories
  attachment :image
end