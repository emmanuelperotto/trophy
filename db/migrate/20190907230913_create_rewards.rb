# frozen_string_literal: true

class CreateRewards < ActiveRecord::Migration[6.0]
  def change
    create_table :rewards do |t|
      t.integer :type
      t.integer :required_value

      t.timestamps
    end
  end
end
