# frozen_string_literal: true

describe GenerateLuckFactor do
  subject(:generator) { described_class.call }

  let(:allowed_factors) { (1..100).to_a }

  it { is_expected.to respond_to(:factor) }

  it { expect(generator.factor).to be_a(LuckFactor) }

  it { expect(allowed_factors).to include(generator.factor.luck) }
end
