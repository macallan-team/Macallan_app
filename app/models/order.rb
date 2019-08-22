class Order < ApplicationRecord

has_many :order_items
belongs_to :end_user
enum payment: [:代金引換,:銀行振込]
enum shipping_status: [:受付,:入荷待ち,:発送済み]

end
