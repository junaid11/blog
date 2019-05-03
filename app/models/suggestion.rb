class Suggestion < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # Validation
  validates :reference_text, presence: true
  validates :body, presence: true
end
