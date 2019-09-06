# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CollectedCoin, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_numericality_of(:value).is_greater_than_or_equal_to(0) }
  end
end
