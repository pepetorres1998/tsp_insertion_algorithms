require 'csv'
require 'pry'
require_relative 'farthest_insertion'
require_relative 'cheapest_insertion'

distances = CSV.read("./distances.csv").map { |row| row.map(&:to_i) }

if ARGV[1].to_i.negative? || ARGV[1].to_i > distances.length
  return puts 'La ciudad debe existir y estar en el archivo "distances.csv"'
end

case ARGV[0]
when 'farthest'
  farthest_insertion = FarthestInsertion.new(distances, [ARGV[1].to_i - 1, 0].max)

  puts "\n\nFarthest Insertion Algorithm\n\n\n"
  puts "TSP Route: #{farthest_insertion.print_route}\n"
  puts "Total Cost: #{farthest_insertion.total_cost}\n\n\n"
when 'cheapest'
  cheapest_insertion = CheapestInsertion.new(distances, [ARGV[1].to_i - 1, 0].max)

  puts "\n\nCheapest Insertion Algorithm\n\n\n"
  puts "TSP Route: #{cheapest_insertion.print_route}\n"
  puts "Total Cost: #{cheapest_insertion.total_cost}\n\n\n"
when 'help'
  puts "\n\nEjecute el archivo main.rb y agrege 2 argumentos, el primero para saber el
  algoritmo deseado a ejecutar y el segundo para saber el nodo inicial\n\n\n"

  puts "Ejemplos:\n\n
  bundle exec ruby main.rb farthest 3\n\n
  bundle exec ruby main.rb cheapest 1\n\n
  bundle exec ruby main.rb cheapest\n\n
  *Por default el valor del nodo inicial es 1\n\n"
else
  puts 'Ingresa una opcion de algoritmo valida'
  return
end
