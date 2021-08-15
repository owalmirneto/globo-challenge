# frozen_string_literal: true

describe StartRound do
  subject(:round) { described_class.call(hero.dup, enemy.dup) }

  let(:hero) { build(:character) }
  let(:enemy) { build(:character) }

  it { is_expected.to respond_to(:perform) }
  it { is_expected.to respond_to(:next_hero) }
  it { is_expected.to respond_to(:next_enemy) }
  it { is_expected.to respond_to(:enemy_alive?) }
  it { is_expected.to respond_to(:messages) }

  it 'have next enemy name as hero name' do
    expect(round.next_enemy.name).to eq(hero.name)
  end

  it 'have next hero name as enemy name' do
    expect(round.next_hero.name).to eq(enemy.name)
  end

  describe '.messages' do
    it 'have hero name' do
      expect(round.messages.join).to include(hero.name)
    end

    it 'have hero energy' do
      expect(round.messages.join).to include(hero.energy.to_s)
    end

    it 'have enemy name' do
      expect(round.messages.join).to include(enemy.name)
    end

    it 'have enemy energy' do
      expect(round.messages.join).to include(enemy.energy.to_s)
    end
  end
end
