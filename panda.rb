class Panda

	attr_accessor :name, :email, :gender :friends

	def initialize(name, email, genders)
		@names = name 
		@email = email
		@friends = friends[]
		@gender = gender
	end

	def to_s
		"#{@names}, #{@email}, #{@gender}" #to be edited 
	end 

	def male?
		gender == "male"
	end 

	def female?
		gender == "female"
	end

	def equal?(other)
		name == other.name && email == other.email && gender == other.gender
	end	

	def hash
		to_s.hash
	end

end

class PandaSocialNetwork < Panda
	attr_accessor 
	def initialize ()

	end

	def add_panda(panda)
			
	end

	def has_panda(panda)

	end

	def make_friends(panda1, panda2)

	end

	def are_friends(panda1, panda2)

	end

	def friends_of(panda)

	end

	def connection_level(panda1, panda2)

	end

	def are_connected(panda1, panda2)

	end

	def how_many_gender_in_network(level, panda, gender)

	end


end