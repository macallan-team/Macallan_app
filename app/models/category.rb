class Category < ApplicationRecord

  has_many :items
  validates :name, presence: true, length: { in: 1..10 }
  
  before_destroy :must_not_destroy
  def must_not_destroy
      throw(:abort) if self.items.any?
  end
end
