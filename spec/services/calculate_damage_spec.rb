# frozen_string_literal: true

describe CalculateDamage do
  subject(:calculator) { described_class.call(hero, factor) }

  before { allow(factor).to receive(:luck) { expected_luck } }

  let(:hero) { build(:character) }
  let(:factor) { GenerateLuckFactor.new }
  let(:expected_luck) { rand(0..100) }

  it { is_expected.to respond_to(:damage) }

  context 'when hero attack misses' do
    let(:expected_luck) { random_missed_factor }

    it { expect(calculator.damage).to be_zero }
  end

  context 'when hero attack normal' do
    let(:expected_luck) { random_normal_factor }
    let(:expected_damage) { (hero.power * 1 / 3.to_f).to_i }

    it 'have a third damage' do
      expect(calculator.damage).to eq(expected_damage)
    end
  end

  context 'when hero attack lucky' do
    let(:expected_luck) { random_lucky_factor }
    let(:expected_damage) { (hero.power * 1.2).to_i }

    it 'has a fifth more damage' do
      expect(calculator.damage).to eq(expected_damage)
    end
  end

  context 'when hero attack critical' do
    let(:expected_luck) { random_critical_factor }

    it 'have a double damage' do
      expect(calculator.damage).to eq(hero.power * 2)
    end
  end
end
