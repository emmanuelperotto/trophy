# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "john.doe#{n}@email.com" }
    sequence(:password) { |n| "secret_password#{n}" }
  end
end
