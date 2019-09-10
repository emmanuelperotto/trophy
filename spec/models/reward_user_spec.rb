# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RewardUser, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:reward) }
  end
end
