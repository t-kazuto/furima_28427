FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    family_name           {Gimei.last.kanji}
    first_name            {Gimei.first.kanji}
    family_name_katakana  {Gimei.last.katakana}
    first_name_katakana   {Gimei.first.katakana}
    birthday              {"1930-01-01"}
  end
end
