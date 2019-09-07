# frozen_string_literal: true

class Reward < ApplicationRecord
  # Associations
  has_many :reward_users, dependent: :destroy
  has_many :users, through: :reward_users

  # Validations
  validates :type, presence: true
  validates :required_value, presence: true,
                             numericality: { greater_than_or_equal_to: 0 }
end
