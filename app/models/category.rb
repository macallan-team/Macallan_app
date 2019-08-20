class Category < ApplicationRecord

  has_many :items, dependent: :nullify
  validates :name, presence: true, length: { in: 1..10 }


end
