require_relative 'weapon'

class Shop
  def initialize
  	@ware = create_wares
  end

  def display_wares
  	@wares.each_with_index do |item, index|
  		puts "#{index + 1}, #{item}, Damage: #{item.damage}, Price: #{item.price}"

end

def get_choice
	print "which item do you want? > "
	choice = gets.chomp.to_i - 1
	until wares[choice]
		puts "Dr. House says 'You're an idiot!'"
		print "which item do you want? > "
		choice = gets.chomp.to_i - 1
	end
	return @wares[choice]
end


private
  def create_wares
  	return [
  		weapon.new({name: "club", damage: 4, price: 30}),
  		weapon.new({}),
  		weapon.new({})
  	]
  end

end