class ProductsController < ApplicationController

  before_action :authenticate_user! , only: [:new]

  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @products = Product.includes(:user).order("created_at ASC")
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
       redirect_to root_path
    else
       render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def  edit
    @product = Product.find(params[:id])
  end
  
  def update
    product = Product.find(params[:id])
    product.update(product_params)
    if product.save
       redirect_to root_path
    else
       render :edit
    end
  end



  private

  def product_params
    params.require(:product).permit(:name,:price,:status_id,:category_id,:description,:judgment_id,:day_id,:prefecture_id,:image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    @product = Product.find(params[:id])
    redirect_to root_path unless current_user.id == @product.user_id
  end


end
