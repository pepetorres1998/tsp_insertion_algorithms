# TSP Insertion Algorithms

Farthest Insertion Algorithm, Cheapest Insertion Algorithm for TSO class.

## How to run it?

Just run with ruby interpreter the `main.rb` file with 2 arguments.
The first one with the name of the insertion algorithm to use and the second one with which
city to be the starting_node/starting_city (Starts in 1, not in 0 as arrays).

\- Wtf is ruby? lol.

\- [**I got you**](https://www.ruby-lang.org/en/)

Examples:
- `ruby main.rb farthest 1`
- `ruby main.rb farthest 2`
- `ruby main.rb cheapest 3`
- `ruby main.rb cheapest 4`
- `ruby main.rb cheapest 5`
- `ruby main.rb farthest` (By default the starting_node/city is 1).

## Want to use different data?

You could use different data by changing the `distances.csv` file.
It has to be square (same length of rows and columns).

The data is readed by rows left to right, that means that in here traveling from City 1 to City 2 has a cost of 5.
But traveling from City 2 to City 1 has a cost of 8. 

|        | City 1 | City 2 | City 3 |
| :----: | :----: | :----: | :----: |
| City 1 |   0    |   5    |   3    |
| City 2 |   8    |   0    |   2    |
| City 3 |   3    |   2    |   0    |

Thank you for reading! :v:
