require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

	def perform
		puts "Bonjour, et bienvenue dans la V1 de notre jeu de baston interractif !"
		puts "DIS TON NOMS MATELOT"
		print "> "
		player1 = HumanPlayer.new("#{gets.chomp.to_s}")
		print "Bienvenue #{player1.name} !"
	end 

perform