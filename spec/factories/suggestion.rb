FactoryBot.define do
  factory :suggestion do
    user factory: :user
    post factory: :post
    body { 'new suggestion' }
    reference_text { 'This is reference_text' }
  end
end
