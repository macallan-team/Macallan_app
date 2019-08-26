class Item < ApplicationRecord

has_many :order_items
has_many :reviews
has_many :likes
has_many :cart_items
has_many :discs

belongs_to :artist
belongs_to :label
belongs_to :category
attachment :image

enum sales_status: [:on_sale,:suspension, :deleted]

accepts_nested_attributes_for :discs, allow_destroy: true

validates :album, presence: true, length: { in: 1..30 }
validates :price, presence: true, length: { in: 1..7 }
validates :price, :numericality => { :greater_than => 0 }
validates :stock, presence: true, length: { in: 1..4 }
validates :stock, :numericality => { :greater_than_or_equal_to => 0 }
validates :sales_status, presence: true
validates :category_id, presence: true
validates :label_id, presence: true



# いいね機能
def favorited_by?(end_user)
    likes.where(end_user_id: end_user.id).exists?
end

end
