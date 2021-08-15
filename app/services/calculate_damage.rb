# frozen_string_literal: true

class CalculateDamage
  attr_reader :damage

  def self.call(hero, factor)
    new(hero, factor).perform
  end

  def initialize(hero, factor)
    @hero = hero
    @factor = factor
  end

  def perform
    @damage = (hero.power * multiplier).to_i

    self
  end

  private

  attr_reader :hero, :factor

  def multiplier
    case factor.type
    when :missed then 0
    when :normal then 1 / 3.to_f
    when :lucky then 1.2
    when :critical then 2
    end
  end
end
