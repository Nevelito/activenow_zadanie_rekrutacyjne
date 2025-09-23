class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  def index
    @projects = current_user.projects
                            .where("name ILIKE ?", "%#{params[:q]}%")
                            .order(created_at: :desc)
  end

  def show
    @tasks = @project.tasks.order(created_at: :desc)
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy!
    redirect_to projects_path, notice: "Project was successfully deleted."
  end

  private

  def set_project
    @project = current_user.projects.find_by!(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
