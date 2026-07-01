class PlayerClass
  def initialize(game, marker)
    @game = game
    @marker = marker
  end
  attr_reader :marker, :game
end

class ComputerPlayer < PlayerClass
  def randomizecolors
    new_array = []
    colors = %w[red blue white yellow green pink black orange brown]
    4.times do |i|
      colors.shuffle
      new_array.push(colors[i])
    end
    new_array
  end

  def display_colors
    puts 'red blue white yellow green pink black orange brown'
  end

  def give_hint(colors_guessed_array, secret_code_array)
    colored_peg = 0
    white_peg = 0
    colors_guessed_array.each_with_index do |i, v|
      secret_code_array.each_with_index do |y, x|
        if i == y && v == x
          colored_peg += 1
        elsif i == y && v != x
          white_peg += 1
        end
      end
    end
    puts "Colored peg: #{colored_peg}, White Peg: #{white_peg}"
  end
end

class HumanPlayer < PlayerClass
  def guess
    loop do
      puts 'What is your first guess? Hint: The code is 4 colors long'
      answer = gets.chomp.split(' ')
      return answer if answer.length == 4

      puts 'Invalid input'
    end
  end
end

# Todo Define Human PLayer guess method so it can interact with game rb
