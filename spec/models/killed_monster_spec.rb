# frozen_string_literal: true

require 'rails_helper'

RSpec.describe KilledMonster, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:monster) }
  end

  describe '#create' do
    let(:user) { create(:user) }
    let(:monster) { create(:monster, name: %w[turtle bowser].sample) }
    let(:kind) { "killed_#{monster.name.pluralize}" }

    before { seed_rewards }

    [1, 100, 1_000, 10_000, 100_000].each_with_index do |killed_monsters_count, index|
      context "when user's killed_monsters count reaches #{killed_monsters_count}" do
        before { create_list(:killed_monster, killed_monsters_count, user: user, monster: monster) }

        it "expects to reward user with the #{killed_monsters_count}x killed_monsters reward" do
          reward = Reward.where(kind: kind).find_by(required_value: killed_monsters_count)
          expect(user.reload.rewards).to include(reward)
        end

        it 'expects to add a reward to the user' do
          expect(user.reload.rewards.count).to eq(index + 1)
        end
      end

      context "when user's killed_monsters count reaches #{killed_monsters_count - 1}" do
        before { create_list(:killed_monster, killed_monsters_count - 1, user: user, monster: monster) }

        it "expects NOT to reward user with the #{killed_monsters_count}x killed_monsters reward" do
          reward = Reward.where(kind: kind).find_by(required_value: killed_monsters_count)
          expect(user.reload.rewards).not_to include(reward)
        end

        it 'expects NOT to add a reward to the user' do
          expect(user.reload.rewards.count).to eq(index)
        end
      end
    end
  end
end
