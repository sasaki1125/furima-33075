class ProductsController < ApplicationController
  def index
    
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


  private
  def product_params
    params.require(:product).permit(:name,:price,:status_id,:category_id,:description,:judgment_id,:day_id,:prefecture_id,:image).merge(user_id: current_user.id)
  end

end
