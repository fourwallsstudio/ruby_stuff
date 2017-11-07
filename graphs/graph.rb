class Node
  attr_reader :data, :neighbors
  def initialize(data = nil)
    @data = data
    @neighbors = []
  end
end
