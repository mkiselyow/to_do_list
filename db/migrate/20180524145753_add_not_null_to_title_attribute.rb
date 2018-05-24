# frozen_string_literal: true

class AddNotNullToTitleAttribute < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :title, :string, null: false
  end
end
