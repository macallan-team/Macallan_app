class Item < ApplicationRecord


has_many :order_items, :reviews, :likes, :cart_items, :discs
belongs_to :label, :category

end
