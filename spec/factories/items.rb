FactoryBot.define do
  factory :item do
    name                   {'aaaaa'}
    explanation            {'aaaaa'}
    category_id            { 2 }
    condition_id           { 2 }
    shipping_charges_id    { 2 }
    shipping_area_id       { 2 }
    shipping_days_id       { 2 }
    price                  { 300 }
  end
  trait :image do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/public/images/test_image.png')) }
  end
end
