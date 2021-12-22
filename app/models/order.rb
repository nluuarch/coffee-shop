class Order < ActiveRecord::Base
    belongs_to :customer
    belongs_to :coffee

    def receipt
        #p will print and return data / string / object
        p "#{self.customer.name} ordered a #{self.coffee.title} for #{self.price}"
    end

end