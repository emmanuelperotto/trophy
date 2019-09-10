# frozen_string_literal: true

class RewardGiver
  prepend SimpleCommand

  attr_reader :user, :reward_type

  def initialize(user, reward_type)
    @user = user
    @reward_type = reward_type
  end

  def call
    unless valid_reward_type?
      errors.add(:reward_type, 'invalid')
      return nil
    end

    Reward.send(reward_type).find_each do |reward|
      next unless can_reward_user?(reward)

      # TODO: check the requirement of "!" operator
      RewardUser.create!(user: user, reward: reward)
    end
  end

  private

  def valid_reward_type?
    Reward.kinds.keys.include?(reward_type)
  rescue NoMethodError
    false
  end

  # TODO: Lower Assignment Branch Condition Size
  def can_reward_user?(reward)
    return false if reward.required_value.nil? || user.reload.nil?

    case reward_type
    when 'collected_coins'
      !user.rewards.include?(reward) && user.total_coins >= reward.required_value
    when 'deaths'
      !user.rewards.include?(reward) && user.deaths_count >= reward.required_value
    when 'killed_turtles'
      !user.rewards.include?(reward) && user.killed_turtles_count >= reward.required_value
    when 'killed_bowsers'
      !user.rewards.include?(reward) && user.killed_bowsers_count >= reward.required_value
    else
      false
    end
  end
end
