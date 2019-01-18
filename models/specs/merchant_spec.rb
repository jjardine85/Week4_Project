require("minitest/autorun")
require("minitest/rg")
require_relative("../merchant.rb")

class TestMerchant < MiniTest::Test

def setup
  options = {"id" => 1, "name" => "Scotrail", "type" => "travel"}
  @merchant = Merchant.new(options)
end

def test_name_works
  assert_equal("Scotrail", @merchant.name)
end

def test_merchant
  assert_equal("travel", @merchant.type)
end

end
