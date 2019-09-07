# frozen_string_literal: true

class CreateRewardUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :reward_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reward, null: false, foreign_key: true

      t.timestamps
    end
  end
end
