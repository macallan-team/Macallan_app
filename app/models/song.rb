class Song < ApplicationRecord

acts_as_list :scope => :disc
belongs_to :artist
belongs_to :disc

end
