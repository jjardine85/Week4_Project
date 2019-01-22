require_relative("../models/merchant")
require_relative("../models/purchase")
require_relative("../models/user")
require('pry')

Merchant.delete_all
Purchase.delete_all
User.delete_all


user1 = User.new({"name" => "James", "budget" => 100})
user1.save
user2 = User.new({"name" => "Dawn", "budget" => 50})
user2.save
user3 = User.new({"name" => "Minnie Mouse", "budget" => 1000})
user3.save

merchant1 = Merchant.new({"name" => "Scotrail", "type" => "travel"})
merchant2 = Merchant.new({"name" => "Ryanair", "type" => "travel"})
merchant3 = Merchant.new({"name" => "Asda", "type" => "groceries"})
merchant4 = Merchant.new({"name" => "Morrisons", "type" => "groceries"})
merchant5 = Merchant.new({"name" => "Tesco", "type" => "groceries"})
merchant6 = Merchant.new({"name" => "Sainsburys", "type" => "groceries"})
merchant7 = Merchant.new({"name" => "Waitrose", "type" => "groceries"})
merchant8 = Merchant.new({"name" => "Co-op", "type" => "groceries"})
merchant9 = Merchant.new({"name" => "Nisa", "type" => "groceries"})
merchant10 = Merchant.new({"name" => "local shop", "type" => "groceries"})
merchant11 = Merchant.new({"name" => "Iceland", "type" => "groceries"})
merchant12 = Merchant.new({"name" => "Farmfoods", "type" => "groceries"})
merchant13 = Merchant.new({"name" => "Ocado", "type" => "groceries"})
merchant14 = Merchant.new({"name" => "Bus", "type" => "travel"})
merchant15 = Merchant.new({"name" => "Train", "type" => "travel"})
merchant16 = Merchant.new({"name" => "Flight", "type" => "travel"})
merchant17 = Merchant.new({"name" => "Ferry", "type" => "travel"})
merchant18 = Merchant.new({"name" => "Petrol", "type" => "travel"})
merchant19 = Merchant.new({"name" => "Electricity", "type" => "utilities"})
merchant20 = Merchant.new({"name" => "Gas", "type" => "utilities"})
merchant21 = Merchant.new({"name" => "Council Tax", "type" => "utilities"})
merchant22 = Merchant.new({"name" => "TV licence", "type" => "utilities"})
merchant23 = Merchant.new({"name" => "Mortgage", "type" => "utilities"})
merchant24 = Merchant.new({"name" => "Phone bill", "type" => "utilities"})
merchant25 = Merchant.new({"name" => "Water bill", "type" => "utilities"})
merchant26 = Merchant.new({"name" => "Gym", "type" => "leisure"})
merchant27 = Merchant.new({"name" => "Cinema", "type" => "leisure"})
merchant28 = Merchant.new({"name" => "Bowling", "type" => "leisure"})
merchant29 = Merchant.new({"name" => "Burton", "type" => "retail"})
merchant30 = Merchant.new({"name" => "Next", "type" => "retail"})
merchant31 = Merchant.new({"name" => "Boohoo", "type" => "retail"})
merchant32 = Merchant.new({"name" => "Debenhams", "type" => "retail"})
merchant33 = Merchant.new({"name" => "Marks & Spencer", "type" => "retail"})
merchant34 = Merchant.new({"name" => "Matalan", "type" => "retail"})
merchant35 = Merchant.new({"name" => "ASOS", "type" => "retail"})
merchant36 = Merchant.new({"name" => "Very", "type" => "retail"})
merchant37 = Merchant.new({"name" => "Starbucks", "type" => "food"})
merchant38 = Merchant.new({"name" => "Take-away", "type" => "food"})
merchant39 = Merchant.new({"name" => "ad-hoc", "type" => "ad-hoc"})
merchant40 = Merchant.new({"name" => "Bank", "type" => "utilities"})

merchant1.save
merchant2.save
merchant3.save
# merchant4.save
# merchant5.save
# merchant6.save
# merchant7.save
# merchant8.save
# merchant9.save
# merchant10.save
# merchant11.save
# merchant12.save
# merchant13.save
# merchant14.save
# merchant15.save
# merchant16.save
# merchant17.save
# merchant18.save
# merchant19.save
# merchant20.save
# merchant21.save
# merchant22.save
# merchant23.save
# merchant24.save
# merchant25.save
# merchant26.save
# merchant27.save
# merchant28.save
# merchant29.save
# merchant30.save
# merchant31.save
# merchant32.save
# merchant33.save
# merchant34.save
# merchant35.save
# merchant36.save
# merchant37.save
# merchant38.save
# merchant39.save
# merchant40.save

purchase1 = Purchase.new({"amount" => 10, "merchant" => merchant3.name,
            "merchant_id" => merchant3.id, "date_picked" => "now", "type" => merchant3.type, "user_id" => user1.id})
purchase1.save
purchase2 = Purchase.new({"amount" => 5, "merchant" => merchant3.name,
            "merchant_id" => merchant3.id, "date_picked" => "04-04-2019", "type" => merchant3.type, "user_id" => user2.id})
purchase2.save
purchase3 = Purchase.new({"amount" => 50, "merchant" => merchant1.name,
            "merchant_id" => merchant1.id, "date_picked" => "03-03-2019", "type" => merchant3.type, "user_id" => user3.id})
purchase3.save
purchase4 = Purchase.new({"amount" => 70, "merchant" => merchant1.name,
            "merchant_id" => merchant1.id, "date_picked" => "02-02-2019", "type" => merchant3.type, "user_id" => user3.id})
purchase4.save
purchase5 = Purchase.new({"amount" => 700, "merchant" => merchant2.name,
            "merchant_id" => merchant2.id, "date_picked" => "2019-01-01", "type" => merchant2.type, "user_id" => user3.id})
purchase5.save


binding.pry
nil
