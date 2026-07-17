class PlayerClass
  def initialize(game, marker)
    # Perhaps make usage of these?
    @game = game
    @marker = marker
  end
  attr_reader :marker, :game
end

class ComputerPlayer < PlayerClass
  def give_hint(colors_guessed_array, secret_code_array)
    # OPTIMIZE: by using seperate if statements
    colored_peg = 0
    white_peg = 0
    occupied_places = []
    colors_guessed_array.each_with_index do |value, index|
      secret_code_array.each_with_index do |value1, index1|
        if value == value1 && index == index1
          next if occupied_places.include?(index1)

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

# TODO
# Make method for:
# Check if a color becomes 1, otherwise keep all the ones and:
# If it does become 1, then check if all the values are 1, otherwise we do the below
#
#
# Shuffle between 2 and 3 for 2 (cuz 2 was the value just in wrong position, and 3 is values we dont care about)
# Change color if 3
