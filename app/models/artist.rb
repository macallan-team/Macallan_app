class Artist < ApplicationRecord

  has_many :songs, dependent: :nullify

end
