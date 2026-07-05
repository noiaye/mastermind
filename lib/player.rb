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
end

# TODO
#
# How to deal with duplicates
#
# yellow green white white: guessed
# yellow blue white white: actual
#
# output so far: 2 COLORED PEG?? 0 white peg
#
#
#

# So for the special case where the values are the same but the indexes are different
# We need to only get the first occurence of a value which is not already occupied by a different value
# so maybe we can have an array index of matched values and then go from there
