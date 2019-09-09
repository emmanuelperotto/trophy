# frozen_string_literal: true

class Death < ApplicationRecord
  # Associations
  belongs_to :user, counter_cache: true

  # Callbacks
  after_create :reward_user

  # Methods
  private

  def reward_user
    RewardGiver.call(user, 'deaths')
  end
end
