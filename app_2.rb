require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

	def perform
		puts "  Bonjour, et bienvenue dans la V1 de notre jeu de baston interactif :"
		puts ""
		puts "‿︵‿︵(ಥ﹏ಥ)‿︵‿︵     ILS VEULENT TOUS MA POO !!    ‿︵‿︵(ಥ﹏ಥ)‿︵‿︵"
		puts "            ●○●○●○●○●○●○●○●○●○ （´д｀）●○●○●○●○●○●○●○●○●○"
		puts ""
		puts "DIS TON NOMS MATELOT"
		puts ""
		print "> "
		user = HumanPlayer.new("#{gets.chomp.to_s}")
		puts " "
		print "Bienvenue #{user.name} !"
		puts " "
		enemies = []
		enemies1 = Player.new("Josiane")
		enemies2 = Player.new("José")
		enemies.push(enemies1, enemies2) 

while  user.life_points > 0 && (enemies1.life_points > 0 || enemies2.life_points > 0)

	puts "Voici l'état de #{user.name}: "
	user.show_state

	puts "Quelle action veux tu effectuer ?"
	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner "
	puts ""
	puts "Attaquer un joueur en vue :"
	if enemies1.life_points > 0
	print "0 - " 
	print enemies1.show_state 
end
	if enemies2.life_points > 0
	print "1 - "
	print enemies2.show_state
end
	puts " "
	print "> "
	answer = gets.chomp.to_s
	if answer == "a"
		user.search_weapon
	end 
	if answer == "s"
		user.search_health_pack
	end 
	if answer == "0"
		user.attacks(enemies1)
	end 
	if answer == "1"
		user.attacks(enemies2)
	end

	puts "Les autres joueurs t'attaquent !"

	enemies.each do |atk|
		if (atk.life_points > 0)
			atk.attacks(user)
		else 
				enemies.delete(atk)
		end
	end

	
	end
	end 

perform








