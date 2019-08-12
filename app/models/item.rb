class Item < ApplicationRecord


has_many :order_items
has_many :reviews
has_many :likes
has_many :cart_items
has_many :discs

belongs_to :label
belongs_to :category
attachment :image

accepts_nested_attributes_for :discs, allow_destroy: true

# 検索機能
def self.search(search)
    if search
        where(['label_id LIKE ?', 'category_id LIKE ?', 'album LIKE ?', 'name LIKE ?', 'artist_id LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
        Item.all
    end
end



end
