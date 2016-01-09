class PandaSocialNetwork

	def initialize
		@network = {}
	end

	def add_panda(panda)
		raise "PandaAlreadyThere" if has_panda(panda)
		@network[panda] = []
	end

	def has_panda(panda)
		@network.has_key?(panda)
	end

	def make_friends(panda1, panda2)
		raise "PandasAlreadyFriends" if are_friends(panda1, panda2)
		add_panda(panda1) unless has_panda(panda1)
		add_panda(panda2) unless has_panda(panda2)

		@network[panda1] << panda2
		@network[panda2] << panda1
	end

	def are_friends(panda1, panda2)
		@network[panda1].has_value?(panda2)
	end

	def friends_of(panda)
		return false unless has_panda(panda)
		@network[panda]
	end

	def connection_level(panda1, panda2)

	end

	def are_connected(panda1, panda2)

	end

	def how_many_gender_in_network(level, panda, gender)

	end

	require "Set"

	private
	def bfs(start)
		q = Queue.new
		visited = Set.new
		q << [0, start]
		visited << start
		
		until q.empty?
			level, current = q.pop
		
			unique_neighbours = @network[current].select { |v| !visited.member? v }
			unique_neighbours.each do |v|
				visited << v
				q << [level+1, v]
			# пътят до v минава през current	path[v] = current
			end
		end
	end

end