require_relative 'player'

class GameClass
  def initialize
    @current_player_id = 1
    @players = [HumanPlayer.new(self, 'human_player'), ComputerPlayer.new(self, 'computer_player')]
  end
  attr_accessor :players, :current_player_id

  def computer_player
    players[1]
  end

  def human_player
    players[0]
  end

  def switch_players
    self.current_player_id = other_player_id
  end

  def computer_play_against_human
    creation = computer_player.randomizecolors
    amount = 1
    # puts creation, 'Code'
    loop do
      computer_player.display_colors
      guess = human_player.guess

      if guess == creation
        puts 'You guessed the code correctly! Well done.'
        break
      elsif guess != creation && amount < 12
        amount += 1
        puts 'Incorrectly guessed but here is a hint mate: '
        p "Guess, #{amount}"
        computer_player.give_hint(guess, creation)
      else
        p 'Game maker won invalid amount of guessed'
        p "The code was: #{creation}"
        break
      end
    end
  end
end

game = GameClass.new
game.computer_play_against_human
