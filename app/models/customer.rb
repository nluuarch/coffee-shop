class Customer < ActiveRecord::Base
    has_many :orders
    has_many :coffees, through: :orders

    def self.names
        self.pluck(:name)
    end

    def order_coffee(coffee_title, price)
        #find_by title because we dont have id of coffee
        #will give us the coffee instance and will give coffee.id we can use
        coffee = Coffee.find_by(title: coffee_title)
        # price is parameter and is passed in new order's price
        new_order = Order.create(price: price, coffee_id: coffee.id, customer_id: self.id)
        # put out the order's receipt - not the instance of the order
        # .receipt was a method made in order 
        new_order.receipt
    end

    def total_purchases_amount
        self.orders.sum(:price)
    end

    def dislike_coffee(coffee_title)

        #create a coffee instance associated with the parameter
        coffee = Coffee.find_by(title: coffee_title)

        #find the order that matches the coffee id
        #find the .last one
        #then delete it
        order = orders.where("coffee_id = ?", coffee.id).last.delete
        p "#{self.name} has been refunded #{order.price}"

    end

end