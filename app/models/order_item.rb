class OrderItem < ApplicationRecord

belongs_to :order, :item
belongs_to :item

end
