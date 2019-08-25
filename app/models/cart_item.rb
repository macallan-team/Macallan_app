class CartItem < ApplicationRecord

  belongs_to :end_user
  belongs_to :item
  validates :count, :numericality => { :greater_than => 0 }

end
