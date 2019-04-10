require 'minitest/autorun'

class Change

  def self.rec_coin(total_amount, coin_types)
    return 0 if total_amount.zero?
    return 1 if coin_types.any? { |t| t == total_amount }
    raise StandardError if coin_types.min > total_amount

    eligible_coins = coin_types.select { |t| t <= total_amount }.sort
    eligible_coins.reverse_each do |biggest_coin|
      return 1 + rec_coin(total_amount - biggest_coin, coin_types)
    rescue
      next
    end
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

  def test_step_1
    assert_equal(1, Change.rec_coin(1, [1]))
  end

  def test_recursivity
    assert_equal(2, Change.rec_coin(3, [1, 2]))
  end

  def test_complex_recursivity
    assert_equal(2, Change.rec_coin(4, [2, 3]))
  end

  def test_step_4
    assert_equal(9, Change.rec_coin(18, [17, 15, 2]))
  end

end
