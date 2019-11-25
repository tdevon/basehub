module ProjectsHelper
    def edit_task_item(task_item)
        @project = Project.find_by(id: params[:id])
        @task = @project.tasks.find_by(id:task_item.id)
    end
end
