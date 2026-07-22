require_relative 'computer_player'
require_relative 'human_player'

class CodeMaker
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def make_code(colors)
    if name == 'computer'
      ComputerPlayer.make_code_computer(colors)
    elsif name == 'player'
      HumanPlayer.create_colors
    end
  end
end
