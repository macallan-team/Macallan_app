class Song < ApplicationRecord

validates :name, presence: true
acts_as_list :scope => :disc
belongs_to :artist
belongs_to :disc, optional: true

end
