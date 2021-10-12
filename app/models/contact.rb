class Contact < ApplicationRecord

  belongs_to :end_user

  validates :title, presence: true
  validates :content, presence: true

end
