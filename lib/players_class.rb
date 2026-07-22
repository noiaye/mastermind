require_relative 'codemaker_class'
require_relative 'code_decoder_class'
require_relative 'select_player_module'

class PlayersClass
  include SelectPlayer
  attr_accessor :code_maker, :code_breaker

  def initialize
    @code_maker = CodeMaker.new(select_maker(choose_player))
    # @code_breaker = CodeMaker.new(choose_player)
  end
end

examplePlayer = PlayersClass.new
p examplePlayer.code_maker
