class Quote < ApplicationRecord
  belongs_to :admin, optional: true
  belongs_to :end_user, optional: true
  belongs_to :person_profile, optional: true
  belongs_to :category
  has_many :evaluations, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :good_evaluations, lambda { where('status = 0')}, class_name: 'Evaluation'

  attachment :person_image

  validates :person_name,
    presence: true,
    length: { maximum: 20 },
    unless: -> { admin } #adminはこのバリデーションを適用しない

  validates :content,
    presence: true,
    length: { maximum: 100 }

  def evaluationed_good_by?(end_user)
    evaluations.where(end_user_id: end_user.id).where(status: 'good').exists?
  end

  def evaluationed_bad_by?(end_user)
    evaluations.where(end_user_id: end_user.id).where(status: 'bad').exists?
  end

  def evaluation_good
    evaluations.where(status: 'good')
  end

  def evaluation_bad
    evaluations.where(status: 'bad')
  end

end