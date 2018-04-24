class City
    attr_accessor :name
    attr_accessor :visited
    attr_accessor :neighbors
  
    def initialize(name)
      @name = name
      @visited = false
    end
  end