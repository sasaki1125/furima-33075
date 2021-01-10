class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_letter_REGEX = /\A[ぁ-んァ-ン一-龥]/
  
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX}
  validates :nickname, presence: true 
  validates :family_name, presence: true,format: { with: VALID_letter_REGEX}
  validates :first_name, presence: true,format: { with: VALID_letter_REGEX}
  validates :family_name_kana, presence: true,format: { with: VALID_KATAKANA_REGEX}
  validates :first_name_kana, presence: true,format: { with: VALID_KATAKANA_REGEX}
  validates :birth_day, presence: true
  


end