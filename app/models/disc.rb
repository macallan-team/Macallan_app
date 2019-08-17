class Disc < ApplicationRecord

  has_many :songs, ->{order("position ASC")}
  belongs_to :item

	accepts_nested_attributes_for :songs, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }
end
