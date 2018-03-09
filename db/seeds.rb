10.times do 
  Item.create(
    title: Faker::Commerce.product_name, 
    inventory: Faker::Number.number(2), 
    price: Faker::Number.decimal(2)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

user = User.new
user.email = "test@example.com"
user.password = 'password'
user.save



