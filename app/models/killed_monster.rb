# frozen_string_literal: true

class KilledMonster < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :monster
end
