# frozen_string_literal: true

class Character
  include ActiveModel::Validations

  attr_accessor :name, :energy, :power

  validates :name, presence: true
  validates :energy, presence: true,
                     numericality: { only_integer: true, greater_than: 0 }
  validates :power, presence: true,
                    numericality: { only_integer: true, greater_than: 0 }

  def initialize(attributes = {})
    @name = attributes[:name]
    @energy = attributes[:energy].to_i
    @power = attributes[:power].to_i
  end
end