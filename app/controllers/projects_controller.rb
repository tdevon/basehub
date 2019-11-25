class ProjectsController < ApplicationController
    def index
        @projects = current_user.projects.all
    end
    def show
        @project ||= current_user.projects.find_by(id:params[:id])
        if @project
            @task = @project.tasks.build
            # sorting
            @items = @project.tasks.order(:position).all
        end
    end
    def new
        @project = current_user.projects.build if user_signed_in?
    end
    def create
        @project = current_user.projects.build(project_params)
        if @project.save
            redirect_to dashboard_path
        else
            render 'new'
        end
    end
    def edit
        @project = current_user.projects.find_by(id:params[:id])
    end
    def update
        @project = current_user.projects.find_by(id: params[:id])
        if @project.update(project_params)
            redirect_to project_path(@project)
        else
            render 'edit'
        end
    end
    def destroy
        @project = current_user.projects.find_by(id:params[:id])
        @project.destroy
        redirect_to projects_path
    end

private
    def project_params
        params.require(:project).permit(:title)
    end
end
