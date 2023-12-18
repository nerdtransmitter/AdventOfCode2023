# Get game id
# Split game into array at semicolon
# For each subset, split at comma, convert to integer and assign to corresponding color
  # If integer for color lower or equal to max amount possible replace by "true", else replace with false in array

games = {}

def to_hash(lines)
  lines.each do |line|
    game_id, colors = line.split(':') # Split line at colon
    game_id = game_id.strip.match(/\d+/)[0].to_i # Get game id as integer

    colors_counts = colors.split(';').map do |subset| # Split colors at semicolon and map to array
      subset.split(',').map do |color_count|
        color, count = color_count.strip.split(' ')
        [color, count.to_i] # Split subset at comma and map to array
      end.to_h
    end

    games[game_id] = colors_counts
  end
end

max_cubes = { 'red' => 12,
              'green' => 13,
              'blue' => 14 }

def possible?(game)
  possible_games = []
  game.each do |game_id, colors_counts|
    # Compare each subset 
end
# If no false in game found - add game id as integer to possible games array

# Sum all game IDs
def sum_ids
  possible_games.sum
end

def process_file(file_name)
  # File.open(file_name, 'r').sum do |file|
end

test_input = %w(
  Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
  Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
  Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
  Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
  Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
)

# File.write('output.txt', process_file('input.txt'))
File.write('output.txt', sum_ids(test_input))
