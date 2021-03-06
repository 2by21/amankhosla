class ProjectsController < ApplicationController
  layout 'admin_layout'
  before_action :authenticate
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to admin_path
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to admin_path
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to admin_path
  end

  private
    def project_params
      params.require(:project).permit(:name, :url)
    end
end
