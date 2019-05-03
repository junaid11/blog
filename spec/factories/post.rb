FactoryBot.define do
  factory :post do
    user factory: :user
    title { 'Pakistan dabad' }
    body { 'Pakistan ind Pakistan ind Pakistan bad Pakistan bad Pakistan zad vPakistan nda' }
  end
end
