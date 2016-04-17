require_relative '../lib/game'
require_relative '../lib/action'
require 'test/unit'

# tests/game_test.rb
class TestGame < Test::Unit::TestCase
  def test_id
    assert_instance_of(String, Game.new.id)
  end

  def test_shot_save
    player1 = Action.new(1, 2)
    player2 = Action.new(1, 2)
    game = Game.new
    game.shot(player1, player2)
    assert_equal(game.user_goals, 0)
    assert_equal(game.computer_goals, 0)
  end

  def test_shot_goal
    player1 = Action.new(1, 2)
    player2 = Action.new(2, 2)
    game = Game.new
    game.shot(player1, player2)
    assert_not_equal(game.user_goals, game.computer_goals)
  end

  def test_end_game
    game = Game.new
    5.times do
      player1 = Action.new(1, 2)
      player2 = Action.new(1, 2)
      game.shot(player1, player2)
      player1 = Action.new(1, 2)
      player2 = Action.new(2, 2)
      game.shot(player1, player2)
    end
    assert_equal(game.current_action, ActionTypes::ENDGAME)
  end

  def test_not_end_game
    game = Game.new
    10.times do
      player1 = Action.new(1, 2)
      player2 = Action.new(1, 2)
      game.shot(player1, player2)
    end
    assert_not_equal(game.current_action, ActionTypes::ENDGAME)
  end
end
