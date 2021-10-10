class Evaluation < ApplicationRecord

  belongs_to :end_user
  belongs_to :quote

  enum status: { good: 0, bad: 1}
  
end
