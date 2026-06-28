require_relative 'player'

class GameClass
  def initialize
    @current_player_id = 1

    @players = [PlayerClass.new(self, 'human_player'), ComputerPlayer.new(self, 'computer_player')]
  end
  attr_accessor :players, :current_player_id

  def current_player
    players[current_player_id]
  end

  def switch_players
    self.current_player_id = other_player_id
  end

  def other_player_id
    1 - current_player_id
  end

  def computer_play_against_human
    creation = current_player.randomizecolors 
      # guess = guess method
      # break if correctly guessed
      # other wise we give a hint
    end
  end
end

