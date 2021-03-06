require 'pry'
class Player
  attr_accessor :name, :life_points

  @@all_players = []

  # initialisation des valeurs de base des PNJs

  def initialize(name)
    @name = name
    @life_points = 10
    @@all_players << self
  end

  # affichage de l'état du personnage

  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

  def gets_damage(damage)
    @life_points -= damage
    puts "Le joueur #{@name} a été tué !" if @life_points < 1
    return @life_points
    gets.chomp
  end

  # fonction d'attaque

  def attacks(player)
    puts "#{@name} mets un sale coup à #{player.name}"
    damage_taken = compute_damage
    puts "Il lui inflige #{damage_taken} points de dommages"
    player.gets_damage(damage_taken)
    gets.chomp
  end

  # dé 6 de dommages

  def compute_damage
    rand(1..6)
  end

  # retour de l'array liées aux infos des PNJs et au perso du joueur

  def self.all
    @@all_players
  end
end

# initialisation de la classe du joueur

class HumanPlayer < Player
  attr_accessor :weapon_level

  @@all_humans = []

  def initialize(name)
    super(name)
    @weapon_level = 1
    @life_points = 100
    @@all_humans << self
  end

  # Etat de la barre de vie et de l'arme du joueur

  def show_state
    puts "#{@name} a #{@life_points} points de vie et a une arme de niveau #{@weapon_level}."
  end

  # Dé 6 de dommages infligés par le joueur en fonction de l'arme

  def compute_damage
    rand(1..6) * @weapon_level
  end

  # changement d'arme

  def search_weapon
    @weapon_level_new = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{@weapon_level_new}"
    if @weapon_level_new > @weapon_level
      @weapon_level = @weapon_level_new
      puts 'Tu as upgradé ton arme ! Fantastique'
    else
      @weapon_level = @weapon_level
      puts 'Tu gardes ton gourdin actuel...'
    end
    gets.chomp
  end

  # médi-pack du joueur : son niveau de vie augmentera en fonction du score d'un dé 6

  def search_health_pack
    @health_pack = rand(1..6)
    puts "Tu n'as rien trouvé" if @health_pack == 1
    if @health_pack >= 2 && @health_pack <= 5
      @life_points += 50
      puts 'Tu as trouvé un pack de 50 ! Merveilleux !'
    end
    if @health_pack == 6
      @life_points += 80
      puts 'Tu as trouvé un pack de 80 ! Quelle chance !'
    end
    @life_points = 100 if @life_points >= 100
    gets.chomp
  end
end
