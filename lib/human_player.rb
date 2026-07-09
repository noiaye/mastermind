# frozen_string_literal: true

require_relative 'player'
require_relative 'game'

class HumanPlayer < PlayerClass
  def guess
    loop do
      puts 'What is your first guess? Hint: The code is 4 colors long'
      answer = gets.chomp.split(' ')
      return answer if answer.length == 4

      puts 'Invalid input'
    end
  end

  def create_colors
    colors = %w[red blue white yellow green pink black orange brown]
    puts 'Create a color code of 4 colors, they may repeat, format is "color color color color"'
    gets.downcase.split(' ')
  end
end
