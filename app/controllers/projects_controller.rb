class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      flash[:error] = "Project creation failed! #{print_errors(@project)}"
      redirect_to projects_path
    end
  end

  def show
    @project = current_user.projects.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:id])
    if @project.update(project_params)
      redirect_to projects_path
    else
      flash[:error] = "Project failed to update! #{print_errors(@project)}"
      redirect_to projects_path
    end
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    if @project.delete
      redirect_to projects_path
    else
      flash[:error] = "Project deletion failed! #{print_errors(@project)}"
      redirect_to projects_path
    end
  end

  def project_params
    params.permit(:project_name)
  end

  def print_errors project
    project.errors.full_messages.join(", ") + "."
  end
end
