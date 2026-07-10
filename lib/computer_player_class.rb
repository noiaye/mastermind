# frozen_string_literal: true

require_relative 'player'

# Computer Player Child Handler
class ComputerPlayer < PlayerClass
  def initialize
    super
    @colors = %w[red blue white yellow green pink black orange brown]
  end

  def win_condition(array)
    array.all? { |v| v == 1 }
  end

  def swap_condition(array)
    array.any? { |v| v > 1 && array.count(v) > 1 }
  end

  def change_condition(array)
    array.any? { |v| v == 3 }
  end

  def exact_matches(guessed_array, computer_array, colored_peg, occupied_places)
    guessed_array.each do |v, i|
      computer_array.each do |x, z|
        next unless v == x && i == z
        next if occupied_places.include?(z)

        colored_peg += 1
        occupied_places.push(z)
        break
      end
    end
  end

  def randomizecolors
    new_array = []
    4.times do |i|
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
      # Numbers based sytem where 1 is for similar values and 2 and 3 is for something else? Maybe perform a double
      # filter with 2 methods this one, and then another one for same vaue but different index.
    end
    new_arr
  end
end
