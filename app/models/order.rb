class Order < ApplicationRecord

has_many :order_items, :dependent => :destroy
belongs_to :end_user

validates :tax_rate, presence: true
validates :carriage_rate, presence: true
validates :payment, presence: true

  # 氏名　=> 姓名どっちも入る、2〜20文字
  validates :shipping_name, presence: true, length: { in: 2..20 }
  # 郵便番号 => 空欄だめ、ハイフンなしの数字７桁で入力
  validates :shipping_postal_code, presence: true, length: { is: 7 }
  # 住所 => 空欄だめ、2文字〜80文字以内で入力
  validates :shipping_address, presence: true, length: { in: 2..80 }
  # 電話番号 => 空欄だめ、0から始まる10桁〜11桁で入力
  VALID_PHONE_REGEX = /\A0[0-9]{9,10}\z/
  validates :shipping_phone_number, presence: true, format: { with: VALID_PHONE_REGEX }


enum payment: [:代金引換,:銀行振込]
enum shipping_status: [:受付,:入荷待ち,:発送済み]

end
