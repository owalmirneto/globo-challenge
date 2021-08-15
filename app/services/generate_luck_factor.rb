# frozen_string_literal: true

class GenerateLuckFactor
  LUCK_TYPES = { missed: 0..15, normal: 16..70, lucky: 71..96,
                 critical: 97..100 }.freeze

  attr_reader :luck

  def initialize
    @luck = rand(0..100)
  end

  def type
    @type ||= current_luck_type.keys.first
  end

  private

  def current_luck_type
    LUCK_TYPES.select { |_type, factors| factors.to_a.include?(@luck) }
  end
end
