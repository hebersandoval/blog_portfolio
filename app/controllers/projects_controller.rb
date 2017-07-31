class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_only, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update]
  # before_action :set_all_categories, only: [:index, :show, :new, :edit]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
    # if params[:category_id]
    #   @category = Category.find(params[:category_id])
    # end
  end

  def create
    @project = Project.create(project_params)
    # if params[:category_id]
    #   @category = Category.find(params[:category_id])
    #   @project.categories << @category
    # end
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

  def destroy
    Project.find(params[:id]).destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  # def set_all_categories
    # @categories = Category.all
    # @project = Project.find(params[:id])
    # @categories = @project.categories
  # end

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end
end
