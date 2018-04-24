require_relative 'city'
require_relative 'neighbor'

class TravelingSalesman

  attr_accessor :trip

  def initialize
    @trip = Array.new
  end
  
  def nearest_possible_neighbor(current_city)
    origin_city = current_city.name
    while current_city.visited == false
      neighbor_cities = current_city.neighbors
      next_city = neighbor_cities[0]
      
      for current_neighbor in neighbor_cities
        next_city = current_neighbor if current_neighbor.city.visited == false && current_neighbor.distance < next_city.distance
      end
      
      current_city.visited = true
      @trip << current_city.name
      current_city = next_city.city
    end
    @trip.push(origin_city).join(' -> ')
  end
end