class Panda

	attr_accessor :name, :email, :gender

	def initialize(name, email, gender)
		@name = name 
		@email = email
		@gender = gender
	end

	def male?
		gender == "male"
	end 

	def female?
		gender == "female"
	end

	def ==(other)
		to_s == other.to_s && hash == other.hash
	end	

	def to_s
		"#{@name}, #{@email}, #{@gender}"
	end 

	def hash
		to_s.hash
	end

	alias_method :eql?, :==
end	

class PandaSocialNetwork

	#require "Set"

  	attr_accessor :network
	
	def initialize
		@network = Hash.new([])
	end

	def add_panda(panda)
		raise "PandaAlreadyThere" if has_panda(panda)
		network[panda] = []
	end

	def has_panda(panda)
		network.has_key?(panda)
	end

	def make_friends(panda1, panda2)
		raise "PandasAlreadyFriends" if are_friends(panda1, panda2)
		add_panda(panda1) unless has_panda(panda1)
		add_panda(panda2) unless has_panda(panda2)

		network[panda1] << panda2
		network[panda2] << panda1
	end

	def are_friends(panda1, panda2)
		network[panda1].include?(panda2)
	end

	def friends_of(panda)
		return false unless has_panda(panda)
		network[panda]
	end
 
	def connection_level(panda1, panda2)
		return false unless has_panda(panda1) and has_panda(panda2)
		levels = bfs(panda1, panda2)

		levels
	end

	def are_connected(panda1, panda2)
		return false unless connection_level(panda1, panda2)
	end

	def bfs(start, wanted)
		q = Queue.new
		visited = []
		q << [0, start]
		visited << start
		
		until q.empty?
			level, current = q.pop
			return level if wanted == current
		
			unique_neighbours = network[current].select { |v| !visited.member? v }
			unique_neighbours.each do |v|
				visited << v
				q << [level+1, v]
			# пътят до v минава през current	path[v] = current
			end
		end
		-1
	end
  def bfs_gender(search_level, start, gender)
    q = Queue.new
    	visited, result = [], 0	
    q << [0, start]
    visited << start

    until q.empty?
      level, current = q.pop
      result += 1 if level <= search_level and gender == current.gender

      un = network[current].select { |v| !visited.include? v }
      un.each do |v|
        visited << v
        q << [level  + 1, v]
      end
    end

    result
  end

  def how_many_gender_in_network(level, panda, gender)
    bfs_gender(level, panda, gender)
  end


end