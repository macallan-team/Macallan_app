class Item < ApplicationRecord


has_many :order_item, :review, :like, :cart_item, :disc
belongs_to :label, :category

end
