class Artist < ApplicationRecord

  has_many :songs, dependent: :nullify
  validates :name, presence: true, length: { in: 1..20 }

end
