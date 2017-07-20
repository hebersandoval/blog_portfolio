class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :set_all_categories, only: [:index, :show, :new, :edit]

  def index
    if params[:search]
      @posts = Post.search(params[:search]).order('created_at DESC')
    else
      @posts = Post.all.order('created_at DESC')
    end
  end

  def show
  end

  def new
    @post = Post.new
    if params[:category_id]
      @category = Category.find(params[:category_id])
    end
  end

  def create
    @post = Post.create(post_params)
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @post.categories << @category
    end
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids: [])
  end

  def set_post
    @post = Post.find_by_slug(params[:id])
  end

  def set_all_categories
    @categories = Category.all
  end
end
