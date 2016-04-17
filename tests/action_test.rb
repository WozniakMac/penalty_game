require_relative '../lib/action'
require 'test/unit'

# tests/action_test.rb
class TestAction < Test::Unit::TestCase
  def test_validation
    assert_equal(Action.new(1, 2).valid?, true)
    assert_equal(Action.new(-1, -1).valid?, false)
    assert_equal(Action.new('a', 'b').valid?, false)
    assert_equal(Action.new(4, 3).valid?, false)
    assert_equal(Action.new(5, 2).valid?, false)
  end

  def test_errors
    assert_equal(Action.new(1, 2).errors.empty?, true)
    assert_equal(Action.new(1, -1).errors.empty?, false)
    assert_instance_of(Array, Action.new(1, -1).errors)
  end
end
