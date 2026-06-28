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

  def give_hint(colors_guessed_array, secret_code_array)
    colors_guessed_array.each do |color|
      puts "U got the #{color} right" if secret_code_array.include?(color)
    end
  end
end

class HumanPlayer < PlayerClass
end

# Todo Define Human PLayer guess method so it can interact with game rb
