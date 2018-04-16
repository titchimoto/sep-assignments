require_relative 'node'

class Graph
  def initialize
    @films = []
  end

  def find_kevin_bacon(actor_node)
    return "Invalid input. Please try again" if actor_node.nil?
    return "Kevin Bacon IS Kevin Bacon." if actor_node.name == "Kevin Bacon"
    actor_node.film_actor_hash.each do |film, actors|
      actors.each do |actor|
        if actor.name == "Kevin Bacon"
          @films.push(film)
          return @films
        else
          @films.push(film) if !@films.include?(film)
          #start again on the next actor hash
          find_kevin_bacon(actor)
        end
      end
    end
    # checking length of @films array, to ensure a match was found within required limits.
    if @films.length <= 6
        return @films
    else
        return "#{actor_node.name} is not connected to Kevin within 6 degrees or less."
    end
  end
end