require_relative 'codemaker_class'
require_relative 'code_class'
require_relative 'code_decoder_class'
require_relative 'colors_class'
require_relative 'players_class'

class GameManager
  attr_accessor :code_maker, :code, :code_decoder, :maker, :colors, :code_manager

  def initialize
    @maker = PlayersClass.maker
    @code_maker = CodeMaker.new
    @code_decoder = CodeDecoder.new
    @colors = Colors.new
    @code_manager = CodeManager.new(code_maker.make_code(maker, colo))
  end
end
