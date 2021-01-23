class HistoriesController < ApplicationController
  before_action :authenticate_user! 
  before_action :contributor_confirmation, only: [:index,:create]
  
  def index
    @product = Product.find(params[:product_id])
    @history =  HistoryDestination.new
  end
  
  def create
    @product = Product.find(params[:product_id])
    @history = HistoryDestination.new(history_destination_params)
    if @history.valid?
      pay_item
      @history.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def contributor_confirmation
    @product = Product.find(params[:product_id])
    redirect_to root_path if current_user.id == @product.user_id
  end

  def history_destination_params
    params.require(:history_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id] ).merge(token: params[:token])
  end
  def pay_item
    Payjp.api_key = "sk_test_7e853805e452a74937f40529" # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @product.price,  # 商品の値段
      card: history_destination_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end

