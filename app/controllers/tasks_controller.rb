class TasksController < ApplicationController
  def index
    @tasks = current_user.projects.tasks.all
  end

  def create
    @task = project.tasks.create(task_create_params)
    if @task.save
      redirect_to project_path(project)
    else
      flash[:error] = "Task creation failed! #{print_errors(@task)}"
      redirect_to project_path(project)
    end
  end

  def update
    if task.update(task_update_params)
      redirect_to project_path(project)
    else
      flash[:error] = "Task failed to update! #{print_errors(task)}"
      redirect_to project_path(project)
    end
  end

  def destroy
    if task.delete
      redirect_to project_path(project)
    else
      flash[:error] = "Task deletion failed! #{print_errors(task)}"
      redirect_to project_path(project)
    end
  end

  def done
    byebug
    task.update(done: params[:action])

    redirect_to project_path(project)
  end

  private

  def project
    @project = current_user.projects.find(params[:project_id])
  end

  def task
    @task = project.tasks.find(params[:task_id])
  end

  def task_create_params
    params.require(:task).permit(:todo, :deadline)
  end

  def task_update_params
    params.require(:task).permit(:todo, :deadline, :done)
  end

  def print_errors task
    task.errors.full_messages.join(", ") + "."
  end
end
