class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  # Validations
  validates :title, presence: true, length: { minimum: 10 }
  validates :body, presence: true, length: { minimum: 50 }
  # Scope
  default_scope { order('created_at  DESC') }
  scope :approved, -> { where(approve: true) }
  scope :unapproved, -> { where(approve: false) }
  # Methods
  def approve
    update_attribute(:approve, true)
  end
end
