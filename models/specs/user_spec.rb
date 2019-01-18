require("minitest/autorun")
require("minitest/rg")
require_relative("../user.rb")

class TestUser < MiniTest::Test

def setup
  options = {"id" => 1, "name" => "James", "budget" => 100}
  @user = User.new(options)
end

def test_name_works
  assert_equal("James", @user.name)
end

def test_budget
  assert_equal(100, @user.budget)
end

end
