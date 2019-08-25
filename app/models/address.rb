class Address < ApplicationRecord

  belongs_to :end_user
  
  # 氏名　=> 姓名どっちも入る、2〜20文字
  validates :name, presence: true, length: { in: 2..20 }
  # 郵便番号 => 空欄だめ、ハイフンなしの数字７桁で入力
  validates :postal_code, presence: true, length: { is: 7 }
  # 住所 => 空欄だめ、2文字〜80文字以内で入力
  validates :address, presence: true, length: { in: 2..80 }
  # 電話番号 => 空欄だめ、0から始まる10桁〜11桁で入力
  VALID_PHONE_REGEX = /\A0[0-9]{9,10}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }



end
