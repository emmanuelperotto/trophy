# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CollectedCoin, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_numericality_of(:value).is_greater_than_or_equal_to(0) }
  end

  describe '#create' do
    let(:user) { create(:user) }

    before { seed_rewards }

    [1, 100, 1_000, 10_000, 100_000].each_with_index do |collected_coins, index|
      context "when user's total collected coins reaches #{collected_coins}" do
        before { described_class.create!(user: user, value: collected_coins) }

        it "expects to reward user with the #{collected_coins}x collected_coins reward" do
          reward = Reward.collected_coins.find_by(required_value: collected_coins)
          expect(user.reload.rewards).to include(reward)
        end

        it 'expects to add a reward to the user' do
          expect(user.reload.rewards.count).to eq(index + 1)
        end
      end

      context "when user's total collected coins reaches #{collected_coins - 1}" do
        before { described_class.create!(user: user, value: collected_coins - 1) }

        it "expects NOT to reward user with the #{collected_coins}x collected_coins reward" do
          reward = Reward.collected_coins.find_by(required_value: collected_coins)
          expect(user.reload.rewards).not_to include(reward)
        end

        it 'expects NOT to add a reward to the user' do
          expect(user.reload.rewards.count).to eq(index)
        end
      end
    end
  end
end
