# frozen_string_literal: true

class CreateCollectedCoins < ActiveRecord::Migration[6.0]
  def change
    create_table :collected_coins do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
