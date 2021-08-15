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
    @first.valid? & @second.valid?
  end

  def perform
    return mount_errors unless valid?

    @messages = round_start_messages

    start_rounds(@first, @second)

    self
  end

  private

  def character_params(character_info)
    name, energy, power = character_info.split

    { name: name, energy: energy, power: power }
  end

  def mount_errors
    [@first, @second].each_with_index do |character, key|
      next if character.valid?

      @errors << "#{key + 1}°) personagem inválido".yellow.bold

      character.errors.full_messages.each do |message|
        @errors << "× #{message}".red.bold
      end
    end

    self
  end

  def round_start_messages
    ['---'.yellow, t('title.game_started').green,
     t('round.start', **start_message_params).blue, '---'.yellow]
  end

  def start_message_params
    { character1: @first.name, character2: @second.name }
  end

  def start_rounds(hero, enemy)
    loop do
      round = StartRound.call(hero.dup, enemy.dup)

      @messages += round.messages

      break unless round.enemy_alive?

      hero = round.next_hero
      enemy = round.next_enemy
    end
  end
end
