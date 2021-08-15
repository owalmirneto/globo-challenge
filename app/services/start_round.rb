# frozen_string_literal: true

class StartRound
  attr_reader :hero, :enemy

  def self.call(hero, enemy)
    new(hero, enemy).perform
  end

  def initialize(hero, enemy)
    @hero = hero
    @enemy = enemy
  end

  def perform
    enemy.energy -= damage

    self
  end

  def enemy_alive?
    enemy.energy.positive?
  end

  def messages
    [t('round.attack', hero: hero.name, enemy: enemy.name).cyan.bold,
     t("luck_factor.#{factor.type}", hp: damage),
     winner_message].compact
  end

  private

  def winner_message
    return if enemy_alive?

    ['---'.yellow.bold,
     t('round.finish', winner: hero.name, hp: hero.energy).green.bold]
  end

  def damage
    @damage ||= damage_calculator.damage
  end

  def factor
    @factor ||= GenerateLuckFactor.new
  end

  def damage_calculator
    @damage_calculator ||= CalculateDamage.call(hero, factor)
  end
end
