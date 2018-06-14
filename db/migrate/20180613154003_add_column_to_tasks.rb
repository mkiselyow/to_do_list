class AddColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :action, :string
  end
end
