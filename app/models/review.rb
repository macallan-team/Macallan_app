class Review < ApplicationRecord

validates :name, presence: true
validates :comment, presence: true
belongs_to :end_user
belongs_to :item

end
