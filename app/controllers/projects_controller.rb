class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_only, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
    if params[:category_id]
      @category = Category.find(params[:category_id])
    end
  end

  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, category_ids: [])
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end
end
