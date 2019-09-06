# frozen_string_literal: true

class Monster < ApplicationRecord
  # Associations
  has_many :killed_monsters, dependent: :destroy
  has_many :users, through: :killed_monsters

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
