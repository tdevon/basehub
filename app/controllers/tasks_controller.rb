class TasksController < ApplicationController
    def index
    end
    def new
        get_project_from_params
        build_task
    end
    def create
        get_project_from_params
        build_task(task_params)

        if @task.save
            redirect_to project_path(@project)
        else
            render 'new'
        end
    end
    def edit
        get_task_from_params
        get_project_from_task
    end
    def update
        get_task_from_params
        get_project_from_task
        if @task.update(task_params)
            redirect_to @project
        end
    end
    def destroy
        get_project_from_params
        get_task_from_params
        @task.destroy
        redirect_to @project
    end
    def sort
        params[:task].each_with_index do |id,index|
            Task.where(id: id).update_all(position: index + 1)
        end

        head :ok
    end
    
private
    def task_params
        params.require(:task).permit(:name, :date)
    end
    def get_project_from_params
        @project = Project.find_by(id: params[:project_id])
    end
    def get_project_from_task
        @project = Project.find_by(id: @task.project_id)
    end
    def build_task(args=nil)
        @task = @project.tasks.build(args)
    end
    def get_task_from_params
        @task = Task.find_by(id:params[:id])
    end
end
