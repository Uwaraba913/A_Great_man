class Comment < ApplicationRecord

  belongs_to :end_user
  belongs_to :quote

  validates :comment,
    presence: true,
    length: { maximum: 150 }
end
