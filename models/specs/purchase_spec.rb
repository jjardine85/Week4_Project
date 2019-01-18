require("minitest/autorun")
require("minitest/rg")
require_relative("../purchase.rb")

class TestPurchase < MiniTest::Test

  def setup
    options = {"id" => 1, "amount" => 5, "merchant" => "scotrail", "date" => "12/01/2019",
            "time" => "12:00", "type" => "travel"}
    @purchase = Purchase.new(options)

    options2 = {"id" => 2, "amount" => 10, "merchant" => "asda", "date" => DateTime.now.strftime("%d/%m/%Y"),
            "time" => Time.now.strftime("%H:%M"), "type" => "groceries"}
    @purchase2 = Purchase.new(options2)
  end

  def test_amount
    assert_equal(5, @purchase.amount)
  end

  def test_merchant
    assert_equal("scotrail", @purchase.merchant)
  end

  def test_date
    assert_equal("12/01/2019", @purchase.date)
  end

  def test_time
    assert_equal("12:00", @purchase.time)
  end

  def test_type
    assert_equal("travel", @purchase.type)
  end

  def test_dynamic_time
    time = Time.now.strftime("%H:%M")
    assert_equal(time, @purchase2.time)
  end

  def test_dynamic_date
    date = DateTime.now.strftime("%d/%m/%Y")
    assert_equal(date, @purchase2.date)
  end

end
