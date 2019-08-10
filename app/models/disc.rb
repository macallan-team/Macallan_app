class Disc < ApplicationRecord

  has_many :song
  belongs_to :item

end
