# frozen_string_literal: true

class CollectedCoin < ApplicationRecord
  # Associations
  belongs_to :user, counter_cache: true

  # Validations
  validates :value, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Callbacks
  after_create :reward_user

  # Methods
  private

  def reward_user
    RewardGiver.call(user, 'collected_coins')
  end
end
