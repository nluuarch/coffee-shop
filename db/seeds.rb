puts "deleting data... "
Order.destroy_all
Customer.destroy_all
Coffee.destroy_all
puts "deleted!"


puts "creating coffee..."
# Coffee.create(title: )
# Coffee.create(title: )
# Coffee.create(title: )
# or----
3.times do
    Coffee.create(title: Faker::Coffee.blend_name)
end

puts "creating customers..."
3.times do
    Customer.create(name: Faker::Name.name)
end


puts "create orders..."
# .. is including, ... is excluding
# Coffee.all.sample.id = grab a random coffee/customer and grab id from it to input coffee_id / customer_id
30.times do
    Order.create(
        price: rand(1..10), 
        coffee_id: Coffee.all.sample.id, 
        customer_id: Customer.all.sample.id
    )
end
puts "created orders"
