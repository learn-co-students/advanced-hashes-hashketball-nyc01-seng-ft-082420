require 'pry'

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

# Write code here

def num_points_scored(player_name)
  player_pts = 0
  game_hash.each do |team_loc, team_atts|
    team_atts[:players].each do |player_stats|
      # binding.pry
      if player_stats[:player_name] == player_name
        # binding.pry
        player_pts = player_stats[:points]
        # binding.pry
      end
    end
  end
  player_pts
end

def shoe_size(player_name)
  player_shoe_size = 0
  game_hash.each do |team_loc, team_atts|
    team_atts[:players].each do |player_stats|
      if player_stats[:player_name] == player_name
        player_shoe_size = player_stats[:shoe]
        # binding.pry
      end
    end
  end
  player_shoe_size
end

def team_colors(team_name)
  team_colors = ""
  game_hash.each do |team_loc, team_atts|
    # binding.pry
    if team_atts[:team_name] == team_name
      team_colors = team_atts[:colors].to_a
    end
  end
  team_colors
end

def team_names
# binding.pry
  team_names = []
  home_name = game_hash[:home][:team_name]
  away_name = game_hash[:away][:team_name]
  team_names += [home_name, away_name]
  # binding.pry
end

def player_numbers(team_name)
  player_numbers = []
  game_hash.each do |team_loc, team_atts|
    if team_name == team_atts[:team_name]
      team_atts[:players].each do |player_stats|
        # binding.pry
          player_numbers << player_stats[:number]
      end
    end
  end
  player_numbers
end

def player_stats(player_name)
  game_hash.each do |team_loc, team_atts|
    team_atts[:players].each do |player_stats|
      # binding.pry
      if player_name == player_stats[:player_name]
        return player_stats
      end
    end
  end
end

def big_shoe_rebounds
  max_shoe_size = 0
  rebounds = 0
  game_hash.each do |team_loc, team_atts|
    team_atts[:players].each do |player_stats|
      # binding.pry
     if player_stats[:shoe] > max_shoe_size
       max_shoe_size = player_stats[:shoe]
       rebounds = player_stats[:rebounds]
      # binding.pry
      end
    end
  end
  rebounds
end

