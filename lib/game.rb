require 'securerandom'

class Game
  attr_reader :id, :current_action, :user_goals, :computer_goals
  def initialize
    @id = SecureRandom.uuid
    @current_action = Random.new.rand(ActionTypes::SHOT..ActionTypes::SAVE)
    @user_goals = 0
    @computer_goals = 0
    @shot_counter = 0
  end

  def shot(user_action, computer_action)
    return status if @current_action == ActionTypes::ENDGAME
    if @current_action == ActionTypes::SHOT
      @user_goals += 1 if goal?(user_action, computer_action)
      @current_action = ActionTypes::SAVE
    else
      @computer_goals += 1 if goal?(computer_action, user_action)
      @current_action = ActionTypes::SHOT
    end
    @shot_counter += 1
    terminate_game
  end

  def status
    { action: @current_action, user: @user_goals, computer: @computer_goals }
  end

  private

  def goal?(shot, save)
    !(shot.x == save.x && shot.y == save.y)
  end

  def terminate_game
    if ((@user_goals - @computer_goals).abs == 3) ||
       (@shot_counter >= 10 && (@user_goals -
        @computer_goals).abs >= 1 && @shot_counter.even?)
      @current_action = ActionTypes::ENDGAME
    end
  end
end

class ActionTypes
  ENDGAME = 0
  SHOT = 1
  SAVE = 2
end
