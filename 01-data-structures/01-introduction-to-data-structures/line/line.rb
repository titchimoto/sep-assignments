# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    self.members << person
  end

  def leave(person)
    self.members.delete(person)
    # self.members
  end

  def front
    self.members.first
  end

  def middle
    self.members[members.size / 2]
  end

  def back
    self.members.last
  end

  def search(person)
    self.members.include?(person) ? "#{person} is in the line." : "#{person} is not in the line."
  end

  private

  def index(person)
    self.members.index(person)
  end

end
