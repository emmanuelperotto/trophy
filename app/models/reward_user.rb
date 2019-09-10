# frozen_string_literal: true

class RewardUser < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :reward

  # Validations
  validates :user_id, uniqueness: { scope: :reward_id }
end
