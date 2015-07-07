require 'colored'
require 'pry'

require_relative 'hero'
require_relative 'monster'
require_relative 'party'
require_relative 'shop'

class Game
  attr_reader :hero_party
  STOCK_HEROES = [
    Hero.new({
      name: "Artemis",
      hp: 20,
      weapon: Weapon.new({
        name: "longbow",
        damage: 6,
        price: 25
      })
    }),
    Hero.new({
      name: "Arthur",
      hp: 15,
      weapon: Weapon.new({
        name: "longsword",
        damage: 7,
        price: 25
      })
    }),
    Hero.new({
      name: "Gimli",
      hp: 14,
      weapon: Weapon.new({
        name: "great axe",
        damage: 8,
        price: 25
      })
    })
  ]


  def initialize
    @heroes = enlist_heroes
    @shop = Shop.new
    @forest = Forest.new
  end

  def enlist_heroes
    STOCK_HEROES.each_with_index do |hero, index|
      puts "#{index + 1}. #{hero} - HP: #{hero.max_hp}, " + 
           "Weapon: #{hero.weapon}, " + 
           "Damage: #{hero.weapon.damage}"
    end

    print "Choose two heroes for your party (e.g. 1, 2) > "
    choices = gets.chomp.split(', ')

    @hero_party = HeroParty.new

    choices.each do |val|
      @hero_party.enroll(STOCK_HEROES[val.to_i - 1])
    end
    # Display choices for heroes
    # Prompt (gets) the user for choices e.g. 2, 6
    # Create a part with those heroes in it and return it
  end

  def enter_forest

    STOCK_MONSTERS = [
      Monster.new({
      name: "Goblin",
      hp: 9,
      weapon: Weapon.new({
        name: "his wife's rusty last kitchen knife",
        damage: 1,
        price: 1
      }),
      xp: 2,
      gold: 1
    }),
      Monster.new({
        name: "Satyr",
        hp: 30,
        weapon: Weapon.new({
          name: "Mighty Axe",
          damage: 10,
          price: 1
        }),
        xp: 2,
        gold: 1
      }),
      Monster.new({
        name: "Cyclops",
        hp: 15,
        weapon: Weapon.new({
          name: "Wooden club",
          damage: 1,
          price: 1
        }),
        xp: 2,
        gold: 1
      })
    ]
    #monsters.enroll (some stuff)
    # todo: loop @heroes.attack(monsters), monsters.attack(@heroes)...

    def enlist_monsters
    STOCK_MONSTERS.each_with_index do |monster, index|
      puts "#{index + 1}. #{monster} - HP: #{monster.max_hp}, " + 
           "Weapon: #{monster.weapon}, " + 
           "Damage: #{monster.weapon.damage}"
    end

    print "Choose two monsters for your party (e.g. 1, 2) > "
    choices = gets.chomp.split(', ')

    @monster_party = MonsterParty.new

    choices.each do |val|
      @monster_party.enroll(STOCK_MONSTERS[val.to_i - 1])
    end
  end

    # after each of the above attacks, also remember to cleanup
  end

  def enter_shop
    @shop.enter(@heroes)
  end

  def town_message
    puts <<-PLAY_MESSAGE
    Your heroes are ready for action,
    should they...
    1. Enter the forest?
    2. Go shopping for wares?
    PLAY_MESSAGE
  end

  def get_location
    resp = gets.chomp

    if resp == "1"
      return :forest
    else
      return :shop
    end
  end

  def play
    while @heroes.any?
      town_message
      case get_location
      when :forest
        enter_forest
      when :shop
        enter_shop
      end
    end
  end
end

# artemis = Hero.new({
#   name: "Artemis",
#   hp: 20,
#   weapon: Weapon.new({
#     name: "longbow",
#     damage: 6,
#     price: 25
#   })
# })

# goblin = Monster.new({
#   name: "Goblin, father of 7",
#   hp: 9,
#   weapon: Weapon.new({
#     name: "his wife's rusty last kitchen knife",
#     damage: 1,
#     price: 1
#   }),
#   xp: 2,
#   gold: 1
# })

# current_fighters = [artemis, goblin]
# attacker = current_fighters.shift
# attackee = current_fighters.shift

# while attackee.is_alive?
#   attacker.attack(attackee)

#   puts "#{attacker} attacks #{attackee} with his #{attacker.weapon} for #{attacker.weapon.damage}.  #{attackee} now has #{attackee.current_hp} HP left."

#   attacker, attackee = attackee, attacker unless attackee.is_dead?
# end

# puts "#{attackee} is now dead..."

Pry.start(binding)
