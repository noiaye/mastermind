class PlayerClass
  def initialize(game, marker)
    # Perhaps make usage of these?
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

  def random_guess(generated_colors)
    new_arr = []
    copy = generated_colors
    4.times do |i|
      copy.shuffle!
      new_arr.push(copy[i])
      # Numbers based sytem where 1 is for similar values and 2 and 3 is for something else? Maybe perform a double filter with 2 methods this one, and then another one for same vaue but different index.
    end
    new_arr
  end

  def values_and_index(computer_guess, generated_array)
    new_array = []
    generated_array.each_with_index do |v, i|
      computer_guess.each_woth_index do |z, t|
        if v == z && i == t
          new_array.push(1)
          break
        end
      end
    end
    puts "new array: #{new_array}"
    # Values and index means that both the value and the index was matched in the color array that the player generated
    # We should make this keep the colors matched but do something with the rest of the colors
  end

  def display_colors
    puts 'red blue white yellow green pink black orange brown'
  end

  def give_hint(colors_guessed_array, secret_code_array)
    # OPTIMIZE: by using seperate if statements
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
