class AddProjectToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :project, foreign_key: {on_delete: :cascade}
  end
end
