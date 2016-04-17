require_relative '../lib/game_list'
require 'test/unit'

# tests/game_list_test.rb
class TestGameList < Test::Unit::TestCase
  def test_creating_game
    game = GameList.instance.create
    assert_instance_of(Game, game)
    game2 = GameList.instance.find(game.id)
    assert_instance_of(Game, game2)
  end

  def test_game
    game = GameList.instance.create
    assert_equal(GameList.instance.game?(game.id), true)
    assert_equal(GameList.instance.game?('adam'), false)
  end
end
