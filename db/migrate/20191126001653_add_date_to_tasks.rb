class AddDateToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :date, :datetime
  end
end
