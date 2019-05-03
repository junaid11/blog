FactoryBot.define do
  factory :comment do
    user factory: :user
    post factory: :post
    body { 'new  comment' }
  end
end
