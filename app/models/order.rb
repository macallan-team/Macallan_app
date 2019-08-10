class Order < ApplicationRecord

has_many :order_item, dependent: :destroy
belongs_to :end_user, :address

end
