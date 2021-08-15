# frozen_string_literal: true

FactoryBot.define do
  factory :character do
    energy { rand(1..10) * 10 }
    power { rand(1..5) * 10 }

    # trait :missed do
    #   luck { rand(0..15) }
    # end

    # trait :normal do
    #   luck { rand(16..70) }
    # end

    # trait :lucky do
    #   luck { rand(71..96) }
    # end

    # trait :critical do
    #   luck { rand(97..100) }
    # end

    # factory :missed_luck_factor, traits: [:missed]
    # factory :normal_luck_factor, traits: [:normal]
    # factory :lucky_luck_factor, traits: [:lucky]
    # factory :critical_luck_factor, traits: [:critical]
  end
end
