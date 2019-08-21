  class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 苗字 => 空欄だめ、1文字〜20文字以内で入力
  validates :last_name, presence: true, length: { in: 1..20 }
  # 名前 => 空欄だめ、1文字〜20文字以内で入力
  validates :first_name, presence: true, length: { in: 1..20 }
  # 苗字(カナ) => 空欄だめ、1文字〜20文字以内で入力
  validates :last_kana, presence: true, length: { in: 1..20 }
  # 名前(カナ) => 空欄だめ、1文字〜20文字以内で入力
  validates :first_kana, presence: true, length: { in: 1..20 }
  # 郵便番号 => 空欄だめ、ハイフンなしの数字７桁で入力
  validates :postal_code, presence: true, length: { is: 7 }
  # 住所 => 空欄だめ、2文字〜80文字以内で入力
  validates :address, presence: true, length: { in: 2..80 }
  # 電話番号 => 空欄だめ、0から始まる10桁〜11桁で入力
  VALID_PHONE_REGEX = /\A0[0-9]{9,10}\z/
  validates :phone_number, presence: true, uniqueness: true, format: { with: VALID_PHONE_REGEX }
  # メールアドレス => 空欄だめ、【***@***.***】の形で入力　例:aaa@aa.a
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  has_many :likes
  has_many :reviews
  has_many :addresses
  has_many :cart_items
  has_many :orders

  acts_as_paranoid


end
