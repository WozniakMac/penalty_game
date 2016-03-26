require 'sinatra/base'
require 'sinatra/param'
require 'json'
require_relative '../lib/game_list'
require_relative '../lib/action'

class PenaltyGame < Sinatra::Base
  helpers Sinatra::Param

  get '/start.json' do
    content_type :json
    game = GameList.instance.create
    { id: game.id, action: game.current_action }.to_json
  end

  get '/:id/:x/:y/action.json' do
    content_type :json
    param :id,           String, required: true
    param :x,           Integer, required: true
    param :y,           Integer, required: true

    action = Action.new(params[:x].to_s.to_i,params[:y].to_s.to_i)
    if !action.valid?
      return {errors: action.errors.first}.to_json
    else
      if GameList.instance.has_game?(params[:id])
        game = GameList.instance.find(params[:id])
      else
        return {errors: "This game not exist"}.to_json
      end  
      computer = Action.new(Random.new.rand(Action::XMIN..Action::XMAX), Random.new.rand(Action::YMIN..Action::YMAX))
      game.shot(action,computer)
      return game.status.to_json
    end
  end

  get '/:id/status.json' do
    content_type :json
    param :id,           String, required: true
    if GameList.instance.has_game?(params[:id])
      return GameList.instance.find(params[:id]).status.to_json
    else
      return {errors: "This game not exist"}.to_json
    end  
  end
end