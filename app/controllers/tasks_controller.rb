class TasksController < ApplicationController
    def index
    end
    def new
        @project = current_user.projects.find_by(params[:id])
        @task = @project.tasks.build
    end
    def create
        @project = current_user.projects.find_by(params[:id])
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
        @project = current_user.projects.find_by(params[:id])
        @task = @project.tasks.find_by(id:params[:task_id])
        @task.update(task_params)
        redirect_to project_path(@project)
    end
    def destroy
    end
private
    def task_params
        params.require(:task).permit(:name)
    end
end
