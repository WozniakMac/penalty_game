require 'singleton'
require_relative '../lib/game'

# lib/game_list.rb
class GameList
  include Singleton

  def initialize
    @games = {}
  end

  def create
    game = Game.new
    @games[game.id] = game
    game
  end

  def find(id)
    @games[id]
  end

  def game?(id)
    @games.key?(id)
  end
end
