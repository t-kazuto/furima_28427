FactoryBot.define do
  factory :user_item_address do
    token           { 'sample' }
    postal_code     { '123-4567' }
    prefecture_id   { 2 }
    city            { '横浜市緑区' }
    address         { '青山1-1-1' }
    phone_number    { '00000000000' }
    user_id         { 2 }
    item_id         { 2 }
  end
end
