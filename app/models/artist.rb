class Artist < ApplicationRecord

  has_many :songs
  validates :name, presence: true, length: { in: 1..20 }
  before_destroy :must_not_destroy
  def must_not_destroy
      throw(:abort) if self.items.any?
  end

end
