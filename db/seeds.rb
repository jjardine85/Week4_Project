require_relative("../models/merchant")
require_relative("../models/purchase")
require_relative("../models/user")


user1 = User.new({"name" => "James", "budget" => 100})
user1.save
user2 = User.new({"name" => "Dawn", "budget" => 50})
user2.save
user3 = User.new({"name" => "Minnie Mouse", "budget" => 1000})
user3.save

purchase1 = Purchase.new({"amount" => 10, "merchant" => "asda", "date" => "13/01/2019",
        "time" => "14:00", "type" => "groceries", "user_id" => user1.id})
purchase1.save
purchase2 = Purchase.new({"amount" => 5, "merchant" => "scotrail", "date" => "12/01/2019",
        "time" => "12:00", "type" => "travel", "user_id" => user2.id})
purchase2.save
purchase3 = Purchase.new({"amount" => 50, "merchant" => "scotrail", "date" => "17/01/2019",
        "time" => "12:00", "type" => "travel", "user_id" => user3.id})
purchase3.save

merchant1 = Merchant.new({"name" => "Scotrail", "type" => purchase2.type, "purchase_id" => purchase2.id})
merchant1.save
merchant2 = Merchant.new({"name" => "Scotrail", "type" => purchase2.type, "purchase_id" => purchase3.id})
merchant2.save
merchant3 = Merchant.new({"name" => "Scotrail", "type" => purchase3.type, "purchase_id" => purchase3.id})
merchant3.save
