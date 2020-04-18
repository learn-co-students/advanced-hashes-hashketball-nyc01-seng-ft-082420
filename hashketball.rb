
# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored(player)
  game_hash.map do |key, value|
    counter = 0
    while counter < value[:players].length do
      if value[:players][counter][:player_name] == player
        return value[:players][counter][:points]
      end
      counter += 1
    end
  end
end

def shoe_size(player)
  game_hash.map do |key, value|
    counter = 0
    while counter < value[:players].length do
      if value[:players][counter][:player_name] == player
        return value[:players][counter][:shoe]
      end
      counter += 1
    end
  end
end

def team_colors(team)
  game_hash.map do |key, value|
    if value[:team_name] == team
      return value[:colors]
    end
  end
end

def team_names
  array_of_teams = Array.new
  game_hash.collect do |key, value|
    array_of_teams << value[:team_name]
  end
  return array_of_teams
end

def player_numbers(team)
  array_of_numbers = Array.new
  game_hash.map do |key, value|
    if value[:team_name] == team
      counter = 0
      while counter < value[:players].length do
        array_of_numbers << value[:players][counter][:number]
         counter += 1
      end
    end
  end
  return array_of_numbers
end

def player_stats(player)
  hash_of_stats = Hash.new
  game_hash.map do |key, value|
    counter = 0 
    while counter < value[:players].length do
      if value[:players][counter][:player_name] == player
        hash_of_stats = value[:players][counter]
      end
      counter += 1
    end
  end
  return hash_of_stats
end

def big_shoe_rebounds
  biggest_shoe = 0
  player = nil
  game_hash.map do |key, value|
    counter = 0
    while counter < value[:players].length do
      if value[:players][counter][:shoe] >= biggest_shoe
        biggest_shoe = value[:players][counter][:shoe]
        player = value[:players][counter][:player_name]
      end
      counter += 1
    end
    
    counter = 0
    while counter < value[:players].length do
      if value[:players][counter][:player_name] == player
        return value[:players][counter][:rebounds]
      end
      counter += 1
    end
    
  end
end

def most_points_scored
  highest_score = 0
  player = nil
  game_hash.map do |keu, value|
    counter = 0
    while counter < value[:players].length
      if value[:players][counter][:points] >= highest_score
        highest_score = value[:players][counter][:points]
        player = value[:players][counter][:player_name]
      end
      counter += 1
    end
  end
  p player
end

def winning_team
  home_team = 0
  away_team = 0
  game_hash.collect do |key, value|
    if key == :home
      total = 0
      counter = 0
      while counter < value[:players].length
        total += value[:players][counter][:points]
        counter += 1
      end
      home_team = total
    end
    if key == :away
      total = 0
      counter = 0
      while counter < value[:players].length
        total += value[:players][counter][:points]
        counter += 1
      end
      away_team = total
    end
  end
  if home_team > away_team
    puts "#{game_hash[:home][:team_name]} wins!"
  elsif away_team > home_team
    puts "#{game_hash[:away][:team_name]} wins!"
  else
    puts "Tie!"
  end
end

def player_with_longest_name
  longest_name = ""
  game_hash.map do |key, value|
    counter = 0
    while counter < value[:players].length
      if value[:players][counter][:player_name].length > longest_name.length
        longest_name = value[:players][counter][:player_name]
      end
      counter += 1
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  game_hash.map do |key, value|
    counter = 0
    while counter < value[:players].length
      if value[:players][counter][:steals] >= most_steals
        most_steals = value[:players][counter][:steals]
      end
      counter += 1
    end
    counter = 0
    while counter < value[:players].length do
      if value[:players][counter][:player_name] == player_with_longest_name
        puts value[:players][counter][:steals] == most_steals
      end
      counter += 1
    end
  end
end