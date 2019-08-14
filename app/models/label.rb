class Label < ApplicationRecord

has_many :items, dependent: :nullify

end
