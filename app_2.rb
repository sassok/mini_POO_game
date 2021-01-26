require 'bundler'
Bundler.require

require_relative 'lib/player'

# perform et choix du nom du personnage

def perform
  system 'clear'
  puts '  Bonjour, et bienvenue dans la V1 de notre jeu de baston interactif :'
  puts ''
  puts '‿︵‿︵(ಥ﹏ಥ)‿︵‿︵     ILS VEULENT TOUS MA POO !!    ‿︵‿︵(ಥ﹏ಥ)‿︵‿︵'
  puts '            ●○●○●○●○●○●○●○●○●○ （´д｀）●○●○●○●○●○●○●○●○●○'
  puts ''
  puts 'DIS TON NOMS MATELOT'
  puts ''
  print '> '
  user = HumanPlayer.new(gets.chomp.to_s)
  puts ' '
  print "Bienvenue #{user.name} !"
  gets.chomp
  # puts ""
  enemies = []
  enemies1 = Player.new('Josiane')
  enemies2 = Player.new('José')
  enemies.push(enemies1, enemies2)

  # boucle while qui gère l'ensemble des interactions entre le joueur (User) et les PNJs (enemies 1 & 2)

  while user.life_points > 0 && (enemies1.life_points > 0 || enemies2.life_points > 0)
    system 'clear'

    puts "Voici l'état de #{user.name}: "
    user.show_state

    # mise en place du menu

    puts 'Quelle action veux tu effectuer ?'
    puts 'a - chercher une meilleure arme'
    puts 's - chercher à se soigner '
    puts ''
    puts 'Attaquer un joueur en vue :'
    if enemies1.life_points > 0
      print '0 - '
      print enemies1.show_state
    end
    if enemies2.life_points > 0
      print '1 - '
      print enemies2.show_state
    end

    puts ' '
    print '> '
    answer = gets.chomp.to_s
    user.search_weapon if answer == 'a'
    user.search_health_pack if answer == 's'
    user.attacks(enemies1) if answer == '0'
    user.attacks(enemies2) if answer == '1'

    puts "Les autres joueurs t'attaquent !" if enemies1.life_points > 0 || enemies2.life_points > 0

    # boucle d'attaque des ennemis

    enemies.each do |atk|
      atk.attacks(user) if atk.life_points > 0
    end
  end

  # win or loose

  if user.life_points > 0
    puts ''
    puts 'BRAVO ! TU AS GAGNE !'
  else
    puts ''
    puts 'Loser ! Tu as perdu !'
  end
end

perform
