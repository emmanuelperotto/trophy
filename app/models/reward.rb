# frozen_string_literal: true

class Reward < ApplicationRecord
  # Files
  has_one_attached :image

  # Associations
  has_many :reward_users, dependent: :destroy
  has_many :users, through: :reward_users

  # Enums
  enum type: %i[deaths collected_coins
                killed_turtles killed_bowsers]

  # Validations
  validates :type, presence: true
  validates :required_value, presence: true,
                             numericality: { greater_than_or_equal_to: 0 },
                             uniqueness: { scope: :type }
end
