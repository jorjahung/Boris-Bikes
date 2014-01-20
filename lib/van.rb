require_relative 'bike_container'

class Van

	include BikeContainer
	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end
	def get_broken_bikes(location)
		location.give_broken_bikes.each{|bike| dock(bike)}
	end

	def give_bikes(location)
	end
end