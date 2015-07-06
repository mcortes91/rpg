class Party 
	def initialize
		@alive = []
		@dead = []
	end

	def enroll(member)
	end
end

def any?
	@alive.any?
	# should return true if the party has surviving members
end

class HeroParty < Party
	def attack(opposing_party)
		# sending message to user, asking which monster to attack
	end
end

class MonsterParty < Party
	def attack(opposing_party)
		#randomly choose a member of the opposing_party and attack it
	end
end

current_battlefield = [hero_party, monster_party]

while current_battlefield.first.any?
	attacking_party = current_battlefield.first
	attacked_party = current_battlefield.last
	attacking_party.attack(attacked_party)
	current_battlefield.rotate!
end
