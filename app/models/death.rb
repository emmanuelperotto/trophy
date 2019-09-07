# frozen_string_literal: true

class Death < ApplicationRecord
  # Associations
  belongs_to :user, counter_cache: true
end
