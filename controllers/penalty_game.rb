require 'sinatra/base'
require 'sinatra/param'
require 'json'
require_relative '../lib/game_list'
require_relative '../lib/action'

# controllers/penatly_game.rb
class PenaltyGame < Sinatra::Base
  helpers Sinatra::Param

  get '/start.json' do
    content_type :json
    game = GameList.instance.create
    { id: game.id, action: game.current_action }.to_json
  end

  get '/:id/:x/:y/action.json' do
    content_type :json
    param :id, String, required: true
    param :x, Integer, required: true
    param :y, Integer, required: true

    user = Action.new(params[:x].to_s.to_i, params[:y].to_s.to_i)
    return { errors: user.errors.first }.to_json unless user.valid?
    unless GameList.instance.has_game?(params[:id])
      return PenaltyGameErrors.GAME_NOT_EXISTS
    end
    game = GameList.instance.find(params[:id])
    computer = computer_action
    game.shot(user, computer)
    game.status.to_json
  end

  get '/:id/status.json' do
    content_type :json
    param :id, String, required: true
    unless GameList.instance.has_game?(params[:id])
      return PenaltyGameErrors.GAME_NOT_EXISTS
    end
    GameList.instance.find(params[:id]).status.to_json
  end

  private

  def computer_action
    x_rand = Random.new.rand(Action::XMIN..Action::XMAX)
    y_rand = Random.new.rand(Action::YMIN..Action::YMAX)
    Action.new(x_rand, y_rand)
  end
end

class PenaltyGameErrors
  GAME_NOT_EXISTS = { errors: 'This game not exist' }.to_json
end
