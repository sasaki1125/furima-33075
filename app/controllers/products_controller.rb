class ProductsController < ApplicationController
  def index
  end
  def new
  #   @product = Product.new
  end

  # def create
  #   @product = Product.new(product_params)
  #   if @prototype.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end



  # def product_params
  #   params.require(:product).permit(:nickname, :family_name, :first_name, :family_name_kana,:first_name_kana,:birth_day).merge(user_id: current_user.id)
  # end

end
