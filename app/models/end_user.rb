  class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true, length: { in: 1..20 }
  validates :first_name, presence: true, length: { in: 1..20 }
  validates :last_kana, presence: true, length: { in: 1..20 }
  validates :first_kana, presence: true, length: { in: 1..20 }
  validates :postal_code, presence: true, length: { is: 7 }
  validates :address, presence: true, length: { in: 2..80 }

  VALID_PHONE_REGEX = /\A0[0-9]{9,10}\z/
  validates :phone_number, presence: true, uniqueness: true, format: { with: VALID_PHONE_REGEX }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  has_many :likes
  has_many :reviews
  has_many :addresses
  has_many :cart_items
  has_many :orders

  acts_as_paranoid

end
