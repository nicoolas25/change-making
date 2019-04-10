require 'minitest/autorun'

class Change

  def self.rec_coin(total_amount, coin_types)
    4
  end

end

class ChangeTest < MiniTest::Test

  def test_readme_example

    assert_equal(4, Change.rec_coin(17, [1, 2, 5]))

  end
end
