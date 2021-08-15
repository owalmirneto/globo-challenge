# frozen_string_literal: true

def allowed_luck_factors
  (0..100).to_a
end

def random_missed_factor
  Faker::Number.between(from: 0, to: 15)
end

def random_normal_factor
  Faker::Number.between(from: 16, to: 70)
end

def random_lucky_factor
  Faker::Number.between(from: 71, to: 96)
end

def random_critical_factor
  Faker::Number.between(from: 97, to: 100)
end
