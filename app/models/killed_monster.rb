# frozen_string_literal: true

class KilledMonster < ApplicationRecord
  # Associations
  belongs_to :user, counter_cache: true
  belongs_to :monster
end
