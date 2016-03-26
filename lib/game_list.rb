require 'singleton'
require_relative '../lib/game'

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

  def has_game?(id)
    if @games.has_key?(id)
      return true
    else
      return false
    end
  end
end