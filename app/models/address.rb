class Address < ApplicationRecord

  has_many :order
  belongs_to :end_user




end
