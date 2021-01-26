require 'pry'

class Game
attr_accessor :human_player, :enemies

@enemies = []

def initialize(name_human)
@human_player = HumanPlayer.new(name_human)
@enemies = ["Josiane","Jean","Paul","Hanz"]

end
end