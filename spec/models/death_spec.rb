# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Death, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe '#create' do
    let(:user) { create(:user, deaths: build_list(:death, deaths_count)) }

    before { seed_rewards }

    [1, 10, 25, 50, 100].each_with_index do |number_of_deaths, index|
      context "when user died #{number_of_deaths} times" do
        let(:deaths_count) { number_of_deaths - 1 }

        it "expects to reward user with the #{number_of_deaths}x death reward" do
          described_class.create!(user: user)

          reward = Reward.deaths.find_by(required_value: number_of_deaths)
          expect(user.reload.rewards).to include(reward)
        end

        it 'expects to add a reward to the user' do
          described_class.create!(user: user)
          expect(user.reload.rewards.count).to eq(index + 1)
        end
      end

      next if index == 0

      context "when user died #{number_of_deaths - 1} times" do
        let(:deaths_count) { number_of_deaths - 2 }

        it "expects NOT to reward user with the #{number_of_deaths}x death reward" do
          described_class.create!(user: user)

          reward = Reward.deaths.find_by(required_value: number_of_deaths)
          expect(user.reload.rewards).not_to include(reward)
        end

        it 'expects NOT to add a reward to the user' do
          described_class.create!(user: user)
          expect(user.reload.rewards.count).to eq(index)
        end
      end
    end
  end
end
