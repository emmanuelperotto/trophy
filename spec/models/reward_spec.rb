# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reward, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:reward_users).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:reward_users) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:type) }
    it { is_expected.to validate_presence_of(:required_value) }
    it { is_expected.to validate_numericality_of(:required_value).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_uniqueness_of(:required_value).scoped_to(:type).ignoring_case_sensitivity }
  end
end
