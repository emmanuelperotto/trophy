# frozen_string_literal: true

class Death < ApplicationRecord
  # Associations
  belongs_to :user, counter_cache: true

  # Callbacks
  after_create :reward_user

  # Methods
  private

  def reward_user
    Reward.deaths.find_each do |reward|
      next unless can_reward_user?(reward)

      user.rewards << reward
    end
  end

  def can_reward_user?(reward)
    return false if reward.required_value.nil? || user.reload.nil?

    !user.rewards.include?(reward) && user.deaths_count >= reward.required_value
  end
end
