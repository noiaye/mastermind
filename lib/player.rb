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
      p i
      colors.shuffle!
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
    occupied_places = []
    colors_guessed_array.each_with_index do |value, index|
      secret_code_array.each_with_index do |value1, index1|
        if value == value1 && index == index1
          colored_peg += 1
          occupied_places.push(index1)
          break
        elsif value == value1 && index != index1
          next if occupied_places.include?(index1)

          white_peg += 1
          occupied_places.push(index1)
          break
        end
      end
    end

    puts "Colored peg: #{colored_peg}, White Peg: #{white_peg}"
    colored_peg = 0
    white_peg = 0
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

  def create_colors
    colors = %w[red blue white yellow green pink black orange brown]
    puts 'Create a color code of 4 colors, they may repeat, format is "color color color color"'
    gets.downcase.split(' ')
  end
end

# TODO
