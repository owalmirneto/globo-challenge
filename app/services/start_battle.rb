# frozen_string_literal: true

class StartBattle
  attr_reader :errors, :messages

  def self.call(info = {})
    new(info).perform
  end

  def initialize(info = {})
    @first = Character.new(character_params(info[:first]))
    @second = Character.new(character_params(info[:second]))
    @messages = []
    @errors = []
  end

  def valid?
    @first.valid? && @second.valid?
  end

  def perform
    return mount_errors unless valid?

    @messages = round_start_messages

    hero = @first
    enemy = @second

    loop do
      round = StartRound.call(hero.dup, enemy.dup)

      @messages += round.messages

      break unless round.enemy_alive?

      hero = round.enemy
      enemy = round.hero
    end

    puts @messages

    self
  end

  private

  def character_params(character_info)
    name, energy, power = character_info.split

    { name: name, energy: energy, power: power }
  end

  def mount_errors
    [@first, @second].each do |character|
      character.errors.messages.each do |label, messages|
        @errors << "× #{label} #{messages.first}".red.bold
      end
    end

    self
  end

  def round_start_messages
    [t('title.game_started').green.bold,
     t('round.start', character1: @first.name, character2: @second.name)]
  end
end
