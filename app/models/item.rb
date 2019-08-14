class Item < ApplicationRecord


has_many :order_items
has_many :reviews
has_many :likes
has_many :cart_items
has_many :discs

belongs_to :label
belongs_to :category
attachment :image

enum sales_status: [:on_sale,:suspention]

accepts_nested_attributes_for :discs, allow_destroy: true

validates :album, presence: true, length: { in: 2..30 }
validates :price, presence: true, length: { in: 2..7 }
validates :stock, presence: true, length: { in: 1..4 }
validates :sales_status, presence: true
validates :category_id, presence: true
validates :label_id, presence: true

# 検索機能
def self.search(search)
    if search
        where(['label_id LIKE ?', 'category_id LIKE ?', 'album LIKE ?', 'name LIKE ?', 'artist_id LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
        Item.all
    end
end



end
