class HistoriesController < ApplicationController
  before_action :authenticate_user! , except: [:index,:show]
  before_action :details
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  
  def index
    
    @history =  HistoryDestination.new
  end
  
  def create
    
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
    
    redirect_to root_path if current_user.id == @product.user_id && @product.history
  end

  def history_destination_params
    params.require(:history_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id] ).merge(token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @product.price,  # 商品の値段
      card: history_destination_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def details
    @product = Product.find(params[:product_id])
  end

end

