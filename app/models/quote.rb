class Quote < ApplicationRecord
  belongs_to :admin, optional: true
  belongs_to :end_user, optional: true
  belongs_to :person_profile, optional: true
  belongs_to :category
  has_many :evaluations, dependent: :destroy

  attachment :person_image

  def evaluationed_by?(end_user)
    evaluations.where(end_user_id: end_user.id).exists?
  end

  def evaluation_good
    evaluations.where(status: 'good')
  end

  def evaluation_bad
    evaluations.where(status: 'bad')
  end

end