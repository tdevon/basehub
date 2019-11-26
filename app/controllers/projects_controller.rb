class ProjectsController < ApplicationController
    def index
        @projects = current_user.projects.all
    end
    def show
        get_project
        get_tasks(@project)
    end
    def new
        create_new_project
    end
    def create
        create_new_project(project_params)
        if @project.save
            redirect_to dashboard_path
        else
            render 'new'
        end
    end
    def edit
        get_project
    end
    def update
        get_project
        if @project.update(project_params)
            redirect_to project_path(@project)
        else
            render 'edit'
        end
    end
    def destroy
        get_project
        @project.destroy
        redirect_to projects_path
    end

private
    def project_params
        params.require(:project).permit(:title)
    end
    def get_project
        @project = current_user.projects.find_by(id:params[:id])
    end
    def get_tasks(project)
        if project
            @task = project.tasks.build
            # sorting
            @items = project.tasks.order(:position).all
        end
    end
    def create_new_project(args = nil)
        @project = current_user.projects.build(args)
    end
end
