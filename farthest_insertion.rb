require 'pry'

class FarthestInsertion
  attr_accessor :distances, :route, :k_node

  def initialize(distances, starting_node)
    @distances = distances
    @route = [starting_node, get_first_node(starting_node), starting_node]

    start_algorithm
  end

  def print_route
    route.map { |node| node + 1 }
  end

  def total_cost
    paths.map { |nodes| distances[nodes[0]][nodes[1]] }.sum
  end

  private

  def get_first_node(starting_node)
    distances_from_starting_node = distances[starting_node]
    max_distance = distances_from_starting_node.select(&:positive?).max
    distances_from_starting_node.find_index(max_distance)
  end

  def start_algorithm
    while route.length - 1 < distances.length
      get_k
      path = where_to_insert_k
      insert_k(path)
    end
  end

  def insert_k(path)
    path_index = paths.find_index(path) + 1
    route.insert(path_index, k_node)
  end

  def where_to_insert_k
    paths_delta_f = paths.map do |path|
      distances[path[0]][k_node].to_i + \
      distances[k_node][path[1]].to_i - \
      distances[path[0]][path[1]].to_i
    end
  
    index_of_minimum_distance = paths_delta_f.find_index(paths_delta_f.min)
  
    paths[index_of_minimum_distance]
  end

  def get_k
    max_value = 0
    max_value_path = []

    distances.map.with_index do |row, index|
      unless route.include? index
        row.map.with_index do |column, subindex|
          if route.include? subindex
            if column > max_value
              max_value = column
              max_value_path = [index, subindex]
            end
          end
        end
      end
    end

    self.k_node = (max_value_path - route).first
  end

  def paths
    route.map.with_index do |node, index|
      [route[index], route[index + 1]] unless index == route.length - 1
    end.reject(&:nil?)
  end
end