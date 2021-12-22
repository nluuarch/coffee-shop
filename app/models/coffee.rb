class Coffee < ActiveRecord::Base
    has_many :orders
    has_many :customers, through: :orders

    def unique_customer_names
        customers.distinct.pluck(:name)

        # uses names method with .uniq to give unique names
        #customers.names.uniq
    end

    def self.most_ordered
        # Coffee.all.max_by {|coffee| coffee.orders.count}
        binding.pry
        Coffee.all.includes(:orders).max_by {|coffee| coffee.orders.length}

        Coffee.all.max_by {|c| c.orders.size}
    end

end