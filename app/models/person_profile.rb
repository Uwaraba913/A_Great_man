class PersonProfile < ApplicationRecord
  has_many :quotes, dependent: :destroy
  attachment :image
end
