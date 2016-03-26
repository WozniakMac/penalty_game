require 'singleton'
require '../lib/game'

class GameList
  include Singleton

  def initialize
    @games = Hash.new
  end

  def create
    game = Game.new
    @games[game.id] = game
    return game
  end

  def find(id)
    @games[id]
  end
end