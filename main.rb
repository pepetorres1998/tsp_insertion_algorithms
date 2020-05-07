require 'csv'
require 'pry'
require_relative 'farthest_insertion'

distances = CSV.read("./#{ARGV[0]}.csv").map { |row| row.map(&:to_i) }
if ARGV[1].to_i.negative? || ARGV[1].to_i > distances.length
  return puts 'La ciudad debe existir'
end

farthest_insertion = FarthestInsertion.new(distances, ARGV[1].to_i - 1)

puts "\n\nFarthest Insertion Algorithm\n\n\n"
puts "TSP Route: #{farthest_insertion.print_route}\n"
puts "Total Cost: #{farthest_insertion.total_cost}\n\n\n"
