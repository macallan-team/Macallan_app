class Order < ApplicationRecord

has_many :order_items
belongs_to :end_user
belongs_to :address

end
