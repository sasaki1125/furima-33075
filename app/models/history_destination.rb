class HistoryDestination

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :product_id, :user_id, :token
  

  VALID_POST_REGEX =  /\A\d{3}-\d{4}\z/
  VALID_PHONE_NUMBER_REGEX = /\A\d{11}\z/
  VALID_CITY_REGEX = /\A[ぁ-んァ-ン一-龥々]/


  with_options presence: true do
    validates :post_code ,format: { with: VALID_POST_REGEX}
    validates :prefecture_id,numericality: { other_than: 1 }
    validates :city,format: { with: VALID_CITY_REGEX}
    validates :address
    validates :phone_number,format: { with: VALID_PHONE_NUMBER_REGEX}
    validates :token
    validates :user_id
    validates :product_id
  end

  def save
    history = History.create!(user_id: user_id,product_id: product_id)
    Destination.create(post_code: post_code,prefecture_id: prefecture_id,city: city,address: address,building_name: building_name,phone_number: phone_number, history_id:  history .id)
  end

end
