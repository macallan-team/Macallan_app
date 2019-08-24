class Carriage < ApplicationRecord
    enum valid_flag: [:off ,:on]
    before_destroy :must_not_destroy
    def must_not_destroy
        throw(:abort) if self.valid_flag == 'on'
    end  
end
