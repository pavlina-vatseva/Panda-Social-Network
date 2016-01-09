class PandaSocialNetwork < Panda
	attr_accessor :network

	def initialize (network)
		@network = network{}
	end

	def add_panda(panda)
		
	end

	def has_panda(panda)
		network.has_key?("panda")
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