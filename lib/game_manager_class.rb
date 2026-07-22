require_relative 'codemaker_class'
require_relative 'code_class'
require_relative 'code_decoder_class'
require_relative 'colors_class'
require_relative 'players_class'

class GameManager
  attr_accessor :code_maker, :code, :code_decoder, :maker, :colors, :code_manager, :players_handler

  def initialize
    @players_handler = PlayersClass.new
    @code_maker = CodeMaker.make_code
    @code_decoder = CodeDecoder.new
    @colors = Colors.new
    @code_manager = CodeManager.new(code_maker.make_code(maker, colors))
  end

  def compare_guess_code
    #
  end
end
