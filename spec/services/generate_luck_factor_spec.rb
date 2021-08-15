# frozen_string_literal: true

describe GenerateLuckFactor do
  subject(:generator) { described_class.new }

  it 'respond to type method' do
    expect(generator).to respond_to(:type)
  end

  it 'respond to luck method' do
    expect(generator).to respond_to(:luck)
  end

  it 'include in allowed factors' do
    expect(allowed_luck_factors).to include(generator.luck)
  end

  describe 'all types' do
    before do
      allow(generator).to receive(:luck) { expected_luck }
    end

    context 'when hero low luck' do
      let(:expected_luck) { random_missed_factor }

      it 'have type missed' do
        expect(generator.type).to eq(:missed)
      end
    end

    context 'when hero normal luck' do
      let(:expected_luck) { random_normal_factor }

      it 'have type normal' do
        expect(generator.type).to eq(:normal)
      end
    end

    context 'when hero good luck' do
      let(:expected_luck) { random_lucky_factor }

      it 'have type lucky' do
        expect(generator.type).to eq(:lucky)
      end
    end

    context 'when hero double luck' do
      let(:expected_luck) { random_critical_factor }

      it 'have type critical' do
        expect(generator.type).to eq(:critical)
      end
    end
  end
end
