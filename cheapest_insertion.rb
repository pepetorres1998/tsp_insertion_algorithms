require_relative 'farthest_insertion'

class CheapestInsertion < FarthestInsertion
  def initialize(distances, starting_node)
    super
  end

  private

  def posible_k_nodes
    (0...distances.length).to_a - route.uniq
  end

  def start_algorithm
    until posible_k_nodes.empty?
      path = where_to_insert_k
      insert_k(path)
    end
  end

  def where_to_insert_k
    k_nodes = posible_k_nodes.map do |k_node|
      paths.map do |path|
        {
          k_node: k_node,
          delta_f: distances[path[0]][k_node].to_i + \
            distances[k_node][path[1]].to_i - \
            distances[path[0]][path[1]].to_i,
          path: [path[0], path[1]],
        }
      end
    end.flatten(1)

    minimum_delta_f = k_nodes.sort_by { |k_node| k_node[:delta_f] }.first

    self.k_node = minimum_delta_f[:k_node]

    minimum_delta_f[:path]
  end

  def get_first_node(starting_node)
    distances_from_starting_node = distances[starting_node]
    min_distance = distances_from_starting_node.select(&:positive?).min
    distances_from_starting_node.find_index(min_distance)
  end
end