# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:deaths).dependent(:destroy) }
    it { is_expected.to have_many(:collected_coins).dependent(:destroy) }
    it { is_expected.to have_many(:killed_monsters).dependent(:destroy) }
    it { is_expected.to have_many(:monsters).through(:killed_monsters) }
  end
end
