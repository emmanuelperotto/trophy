# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Monster, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:killed_monsters).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:killed_monsters) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
