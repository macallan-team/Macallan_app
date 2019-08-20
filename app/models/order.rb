class Order < ApplicationRecord

has_many :order_items
belongs_to :end_user
enum sales_status: [:cash_on_delivery,:bank_transfer]

end