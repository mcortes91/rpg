class Party
  def initialize
    @alive = []
    @dead = []
  end

  def enroll(member)
    @alive << member
  end

  def any?
    @alive.any?
    # should return true if the party has surviving members
    return true
  end

  def none?
    !any?
  end

  def cleanup!
  	the_dead = @alive.select{|member| memeber.is_dead?}
  	@alive -= the_dead
  	@dead -= the_dead
  end
end


class HeroParty < Party
	attr_reader :gold
	def initialize 
		@gold = 0
	super
  def attack(opposing_party)
    # sending message to user, asking which monster to attack
    puts "Which monster would you like to attack?"
  end
end

class MonsterParty < Party
  def attack(opposing_party)
    # randomly choose a member of the opposing_party and attack it
   opposing_party = @alive.sample
   
  end
end

# current_battlefield = [hero_party, monster_party]

# while current_battlefield.first.any?
# 	attacking_party = current_battlefield.first
# 	attacked_party = current_battlefield.last
# 	attacking_party.attack(attacked_party)
# 	current_battlefield.rotate!
# end
