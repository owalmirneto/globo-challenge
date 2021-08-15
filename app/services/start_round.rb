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
    [t('round.attack', **attack_message_params).cyan.bold,
     t("luck_factor.#{factor.type}", hp: damage),
     winner_message].compact
  end

  def attack_message_params
    { hero_name: hero.name, enemy_name: enemy.name,
      hero_energy: hero.energy, enemy_energy: enemy.energy + damage }
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
