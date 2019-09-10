# frozen_string_literal: true

class AddDescriptionToRewards < ActiveRecord::Migration[6.0]
  def change
    add_column :rewards, :description, :text
  end
end
