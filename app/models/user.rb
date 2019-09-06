# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :deaths, dependent: :destroy
  has_many :collected_coins, dependent: :destroy
  has_many :killed_monsters, dependent: :destroy
  has_many :monsters, through: :killed_monsters
end
