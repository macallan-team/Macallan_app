class Label < ApplicationRecord

has_many :items, dependent: :nullify
validates :name, presence: true, length: { in: 1..15 }

end
