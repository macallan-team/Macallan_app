class Disc < ApplicationRecord

  has_many :songs
  belongs_to :item

	accepts_nested_attributes_for :songs
end
