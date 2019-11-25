class TasksController < ApplicationController
    def index
    end
    def new
        @project = current_user.projects.find_by(id: params[:project_id])
        @task = @project.tasks.build
    end
    def create
        @project = current_user.projects.find_by(id: params[:project_id])
        @task = @project.tasks.build(task_params)
        
        if @task.save
            redirect_to project_path(@project)
        else
            render 'new'
        end
    end
    def edit
        @project = current_user.projects.find_by(params[:id])
        @task = @project.tasks.find_by(id:params[:task_id])
    end
    def update
        @project = Project.find_by(id: params[:project_id])
        @task = Task.find_by(id:params[:id])
        @task.update(task_params)
        redirect_to @project
    end
    def destroy
        @project = Project.find_by(id: params[:project_id])
        @task = Task.find_by(id: params[:id])
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
        params.require(:task).permit(:name)
    end
end
