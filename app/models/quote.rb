class Quote < ApplicationRecord
  belongs_to :admin, optional: true
  belongs_to :end_user, optional: true
  belongs_to :person_profile, optional: true
  belongs_to :category
  attachment :person_image
end