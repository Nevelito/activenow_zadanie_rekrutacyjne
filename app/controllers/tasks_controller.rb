class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_task, only: %i[update destroy]

  def new
    @task = @project.tasks.build
  end
  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      TaskDueReminderJob.perform_later(@task.id) if @task.due_date.present?

      redirect_to @project, notice: "Task was successfully created."
    else
      render "projects/show", status: :unprocessable_entity
    end
  end

  def update
    old_due_date = @task.due_date

    if @task.update(task_params)
      if @task.due_date.present? && @task.due_date != old_due_date
        TaskDueReminderJob.perform_later(@task.id)
      end

      redirect_to @project, notice: "Task was successfully updated."
    else
      render "projects/show", status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy!
    redirect_to @project, notice: "Task was successfully deleted."
  end

  private

  def set_project
    @project = current_user.projects.find_by!(id: params[:project_id])
  end

  def set_task
    @task = @project.tasks.find_by!(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date)
  end
end
