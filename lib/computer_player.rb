# frozen_string_literal: true

require_relative 'player'
require 'pry-byebug'

# The computerPLayer class, handles all things done by the computer player
class ComputerPlayer < PlayerClass
  def initialize(game, marker)
    super
    @colored_peg = 0
    @white_peg = 0
    @algorithm_array = %w[nil nil nil nil]
    @occupied_places_f = []
    @occupied_places_h = []
    @colors = %w[red blue white yellow green pink black orange brown]
  end
  attr_accessor :algorithm_array, :occupied_places_f, :colored_peg, :white_peg, :occupied_places_h, :colors

  def randomizecolors
    new_array = []

    4.times do |i|
      p i
      colors.shuffle!
      new_array.push(colors[i])
    end
    new_array
  end

  def check_conditions_three(array)
    array.count { |item| item == 3 }
  end

  def check_conditions_two(array)
    array.count { |item| item != 1 && item < 4 }
  end

  def free_position(array)
    free = []
    array.each_with_index do |v, i|
      next if v == 1

      free.push(i)
    end
  end

  def sample(array)
    array.sample
  end
  
  def randomize( algorithm_array)
    sample(algorithm_array)
  end

  def new_positions(hash, comp_guess)
    new_array = []
    hash.each_pair do |key, value|
      index = key[1]
      value_c = comp_guess[index]
      
      new_array[value] = value_c
    end
    new_array
  end

  def change_2_and_three(algorithm_array, index_of_ones)
    storage_position = 0
    occupied_positions = []
    storageHash = {}
    #    newposition = ''
    algorithm_array.each_with_index do |v, i|
      new_position = 0
      next unless [2, 3].include?(v)

      loop do 
        new_position = [0, 1, 2, 3].sample
        break if occupied_positions.include?(new_position) == false && index_of_ones.include?(new_position) == false && new_position != i
        next
      end

      storage_position = new_position
      occupied_positions.push(storage_position)

      storageHash[[v, i]] = storage_position

      storage_position = 0

       
     end
    storageHash
  end
  # Do this

  def change_three(computer_guess, algorithm_array)
    occupied_colors = []
    storage_hash = {}
    new_color = ''
    algorithm_array.each_with_index do |v, i|
      next unless v == 3

      p 'looks at 3'

      original_color = computer_guess[i]
      loop do
        new_color = colors.sample
        break if new_color != original_color && occupied_colors.include?(new_color) == false

        new_color = 0
      end

      occupied_colors.push(new_color)
      storage_hash["#{original_color}#{i}"] = "[#{new_color}][#{i}]"
    end
    storage_hash
  end

#  def interpret_three(hash)
#    first_value = hash[0]
#    p first_value
#  end

  def do_condition(filter_three, filter_two, algorithm_array)
    loop do
      if check_conditions_three(algorithm_array).positive?
        # Invoke filter three
      elsif check_conditions_two(algorithm_array) >= 2
        # Invoke filter 2
      end
    end
  end

  def give_hint_exact(colors_guessed_array, secret_code_array)
    # Do

    colors_guessed_array.each_with_index do |v, i|
      secret_code_array.each_with_index do |x, y|
        next unless v == x && i == y && occupied_places_h.include?(y) == false

        self.colored_peg += 1
        occupied_places_h.push(y)
        break
      end
    end
  end

  def give_hint_white(colors_guessed_array, secret_code_array)
    colors_guessed_array.each_with_index do |v, i|
      secret_code_array.each_with_index do |x, y|
        next unless v == x && i != y && occupied_places_h.include?(i) == false && occupied_places_h.include?(y) == false

        self.white_peg += 1
        occupied_places_h.push(y)
      end
    end

    # Temoporary
    self.occupied_places_h = []
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

  def perform_filter(player_creation, computer_guess)
    binding.pry
    exact_values(computer_guess, player_creation)
    dif_index(computer_guess, player_creation)
    none_index(computer_guess, player_creation)

    algorithm_array
  end

  def to_zero
    self.colored_peg = 0
    self.white_peg = 0
  end

  def give_colors(player_guess, computer_gen)
    give_hint_exact(player_guess, computer_gen)
    give_hint_white(player_guess, computer_gen)
    puts "Colored pegs: #{colored_peg}, White pegs: #{white_peg}"
    to_zero
  end

  def exact_values(computer_guess, player_creation)
    computer_guess.each_with_index do |v, i|
      player_creation.each_with_index do |x, y|
        next unless v == x && i == y && occupied_places_f.include?(y) == false

        algorithm_array[i] = 1
        occupied_places_f.push(y)
        break
      end
    end
  end

  def dif_index(computer_guess, player_creation)
    computer_guess.each_with_index do |v, i|
      player_creation.each_with_index do |x, y|
        next unless v == x && i != y && occupied_places_f.include?(i) == false && occupied_places_f.include?(y) == false

        algorithm_array[i] = 2
        occupied_places_f.push(y)
        break
      end
    end
  end

  def none_index(computer_guess, player_creation)
    computer_guess.each_with_index do |v, i|
      player_creation.each_with_index do |x, y|
        next unless v != x && occupied_places_f.include?(y) == false && occupied_places_f.include?(i) == false

        algorithm_array[i] = 3
        occupied_places_f.push(y)
        break
      end
    end
  end

  def display_colors
    puts 'red blue white yellow green pink black orange brown'
  end
end

# TODO

# Make the shuffler for algorithm
# Check optimizations required
newGame = ComputerPlayer.new('e', 'e')

c_guess = %w[blue red yellow red]
real_t = %w[blue red green yellow]

algorithm_array = newGame.perform_filter(real_t, c_guess)
p "Algorithm, array #{algorithm_array}"
indexofones = [1]
# hash = newGame.change_three(c_guess, algorithm_array) # Hash should be {red => newColor, index}
# puts hash
p hash = newGame.change_2_and_three(algorithm_array, indexofones) #
p newGame.new_positions(hash, c_guess) 
# How change three works:
# For each 3 in algorith marray
# Make a new hash entry wit the orignal color, and a new generated color with its expected placement index in the expected new array consisting of these modified values and filters
# TODO
# mAKE INDEX OF ONES MAKER FUNCTION
# make interpreter for hashes.
