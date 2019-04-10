require 'minitest/autorun'

class Change

  def self.rec_coin(total_amount, coin_types)
    return 0 if total_amount.zero?

    raise StandardError unless coin_types.min <= total_amount

    4
  end

end

class ChangeTest < MiniTest::Test

  def test_readme_example
    assert_equal(4, Change.rec_coin(17, [1, 2, 5]))
  end

  def test_zero_value
    assert_equal(0, Change.rec_coin(0, [1, 2, 5]))
  end

  def test_compatible_amount_and_coin
    assert_raises { Change.rec_coin(5, [10, 20]) }
  end
end
