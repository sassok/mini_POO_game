require 'pry'
require_relative 'player'
class Game
  attr_accessor :human_player, :enemies

  @enemies = []

  def initialize
    @human_player.HumanPlayer
    @enemies = @@all_players
  end

  def self.start_game
    puts '  Bonjour, et bienvenue dans la V1 de notre jeu de baston interactif :'
    puts ''
    puts '‿︵‿︵(ಥ﹏ಥ)‿︵‿︵     ILS VEULENT TOUS MA POO !!    ‿︵‿︵(ಥ﹏ಥ)‿︵‿︵'
    puts '            ●○●○●○●○●○●○●○●○●○ （´д｀）●○●○●○●○●○●○●○●○●○'
    puts ''
    puts 'DIS TON NOMS MATELOT'
    puts ''
    print '> '
    @human_player = HumanPlayer.new(gets.chomp.to_s)
    puts ' '
    print "Bienvenue #{@human_player.name} !"
    puts ' '
    enemies1 = Player.new('Josiane')
    enemies2 = Player.new('José')
    enemies3 = Player.new('Hanz')
    enemies4 = Player.new('Raoul')
    @enemies.push(enemies1, enemies2, enemies3, enemies4)
  end
end

def perform
  Game.start_game
end

perform

binding.pry
