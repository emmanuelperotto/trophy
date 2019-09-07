# frozen_string_literal: true

class AddCounterCachesToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :deaths_count, :integer, default: 0
    add_column :users, :collected_coins_count, :integer, default: 0
    add_column :users, :killed_monsters_count, :integer, default: 0

    User.find_each do |user|
      User.reset_counters(user.id, :deaths_count, :collected_coins_count, :killed_monsters_count)
    end
  end

  def down
    remove_column :users, :deaths_count, :integer
    remove_column :users, :collected_coins_count, :integer
    remove_column :users, :killed_monsters_count, :integer
  end
end
