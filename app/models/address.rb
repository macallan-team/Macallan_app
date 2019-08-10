class Address < ApplicationRecord

  has_many :orders
  belongs_to :end_user




end
