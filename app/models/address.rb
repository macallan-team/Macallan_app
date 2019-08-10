class Address < ApplicationRecord

  has_many :order
  belongs_to :item




end
