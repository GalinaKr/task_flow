class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def create
    @project = Project.new(project_create_params)
    if @project.save
      redirect_to projects_path
    else
      flash[:error] = "Project creation failed! #{print_errors(@project)}"
      redirect_to projects_path
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_update_params)
      redirect_to projects_path
    else
      flash[:error] = "Project failed to update! #{print_errors(@project)}"
      redirect_to projects_path
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.delete
      redirect_to projects_path
    else
      flash[:error] = "Project deletion failed! #{print_errors(@project)}"
      redirect_to projects_path
    end
  end

  def project_create_params
    params.permit(:project_name)
  end

  def project_update_params
    params.permit(:project_name)
  end

  def print_errors project
    task.errors.full_messages.join(", ") + "."
  end
end
