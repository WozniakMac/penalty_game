require '../lib/game'
require '../lib/action'
require 'test/unit'

class TestGame < Test::Unit::TestCase
  def test_methods
    assert_respond_to(Game.new,:id)
    assert_respond_to(Game.new,:shot)
    assert_respond_to(Game.new,:status)
    assert_respond_to(Game.new,:current_action)
    assert_respond_to(Game.new,:user_goals)
    assert_respond_to(Game.new,:computer_goals)
  end

  def test_id
    assert_instance_of(String,Game.new.id)
  end

  def test_shot_save
    user = Action.new(1,2)
    computer = Action.new(1,2)
    game = Game.new
    game.shot(user,computer)
    assert_equal(game.user_goals,0)
    assert_equal(game.computer_goals,0)
  end
end