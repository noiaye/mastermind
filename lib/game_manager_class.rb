require_relative 'codemaker_class'
require_relative 'code_class'
require_relative 'code_decoder_class'
require_relative 'colors_class'
require_relative 'players_class'

class GameManager
  attr_accessor :code_maker, :code, :code_decoder, :maker, :colors, :code_manager, :players_handler, :colors_manager

  def initialize
    @players_handler = PlayersClass.new
    @code_maker = CodeMaker.new(players_handler.code_maker)
    @colors_manager = Colors.new
    @code_manager = CodeManager.new(code_maker.make_code(colors_manager.colors))
  end

  # def compare_guess_code
  #   #
  # end
end

p GameManager.new.colors_manager
