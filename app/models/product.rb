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
    validates :price,numericality: { only_integer: true,greater_than: 299, less_than: 9999999}
    validates :status_id ,numericality: { other_than: 1 }
    validates :category_id,numericality: { other_than: 1 }
    validates :description
    validates :judgment_id,numericality: { other_than: 1 }
    validates :day_id,numericality: { other_than: 1 }
    validates :prefecture_id,numericality: { other_than: 1 }
  end
  
end
