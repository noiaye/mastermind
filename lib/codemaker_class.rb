require_relative 'computer_player'
require_relative 'human_player'
require_relative 'select_player'

class CodeMaker
  def initialize(name)
    @name = name
  end

  def self.make_code(maker, colors)
    if maker == 'computer'
      ComputerPlayer.make_code_computer(colors)
    elsif maker == 'player'
      HumanPlayer.create_colors
    end
  end
end
