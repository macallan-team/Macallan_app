class Tax < ApplicationRecord
    enum valid_flag: [:off ,:on]
    before_destroy :must_not_destroy
    validates :rate, presence: true
    validates :rate, :numericality => { :greater_than => 1 }
    def must_not_destroy
        throw(:abort) if self.valid_flag == 'on'
    end
end
