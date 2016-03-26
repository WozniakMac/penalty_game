require '../lib/game_list'
require 'test/unit'

class TestGameList < Test::Unit::TestCase
  def test_methods
    assert_respond_to(GameList.instance,:create)
    assert_respond_to(GameList.instance,:find)
  end

  def test_creating_game
    game = GameList.instance.create
    assert_instance_of(Game, game)
    game2 = GameList.instance.find(game.id)
    assert_instance_of(Game, game2)
  end
end