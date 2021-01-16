class Product < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :category
  belongs_to :judgment
  belongs_to :day
  belongs_to :prefecture
  
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :price,numericality: { only_integer: true,greater_than: 299, less_than: 9999999}
    validates :image

  end
  with_options numericality: { other_than: 1 } do
    validates :status_id 
    validates :category_id
    validates :judgment_id
    validates :day_id
    validates :prefecture_id
  end
end
