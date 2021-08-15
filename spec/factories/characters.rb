# frozen_string_literal: true

FactoryBot.define do
  factory :character do
    name { Faker::Fantasy::Tolkien.character }
    energy { Faker::Number.number(digits: 3) }
    power { Faker::Number.number(digits: 2) }
  end
end
