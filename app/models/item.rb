class Item < ApplicationRecord


has_many :order_items
has_many :reviews
has_many :likes
has_many :cart_items
has_many :discs

belongs_to :label
belongs_to :category
attachment :image

accepts_nested_attributes_for :discs
end
