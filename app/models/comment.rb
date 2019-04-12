class Comment < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id',
                     dependent: :destroy
  # validations
  validates :body, presence: true
end
