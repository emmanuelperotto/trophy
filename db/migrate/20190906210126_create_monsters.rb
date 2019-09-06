# frozen_string_literal: true

class CreateMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :monsters do |t|
      t.string :name

      t.timestamps
    end
  end
end
