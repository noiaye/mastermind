# frozen_string_literal: true

require_relative 'human_player'
require_relative 'computer_player_class'
require 'pry'
require 'pry-byebug'

# GameClass is in charge of handling all game events, and controlling the flow of the game itself.
class GameClass
  def initialize
    @current_player_id = 1
    @players = [HumanPlayer.new(self, 'human_player'), ComputerPlayer.new(self, 'computer_player')]
  end
  attr_accessor :players, :current_player_id

  def computer_player
    players[1]
  end

  def switch_colors(colors)
    colors.each_with_index do |v, i|
    end
  end

  def display_colors_game(colors)
    puts colors
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
    puts creation, 'Code'
    loop do
      computer_player.display_colors
      guess = human_player.guess

      if guess == creation
        puts 'You guessed the code correctly! Well done.'
        puts creation
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

  def human_play_against_computer
    creation = human_player.create_colors
    loop do
      display_colors_game(creation)
      guess = computer_player.random_guess(creation)

      if guess == creation
        puts 'Computer wins'
        puts creation
        break
      end
      next unless creation.any? { |v| guess.include?(v) } == true

      puts 'Values and index> ', computer_player.values_and_index(guess, creation)
      puts "Creation: #{creation} Guess: #{guess}"
      break
    end
    # Logic>
    # Human player generates code
    # Loop starts
    # We do as computer vs human method, however we have specialized methods for the computer player
    # Methods required:
    # Guess randomly
    # Uhm, keep colors which were correct
    # Depending on the amount of pegs, we can do different things
    # So you know what let us perhaps make a peg method here so that it will help us
  end
end

game = GameClass.new
game.computer_play_against_human
