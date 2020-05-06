require 'pry'

class InsertionAlgorithm
  def initialize(distances, starting_node)
    @distances = distances
    @route = [starting_node, get_first_node(starting_node), starting_node]
    @total_value = get_total_value

    start_algorithm
  end

  def get_first_node(starting_node)
    binding.pry
  end
end