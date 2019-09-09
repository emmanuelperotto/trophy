# frozen_string_literal: true

class KilledMonster < ApplicationRecord
  # Associations
  belongs_to :user, counter_cache: true
  belongs_to :monster

  # Callbacks
  after_create :reward_user

  # Methods
  private

  def reward_user
    RewardGiver.call(user, "killed_#{monster.name.pluralize}")
  end
end
