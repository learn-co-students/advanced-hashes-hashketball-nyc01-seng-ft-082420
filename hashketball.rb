# Write your code below game_hash
require "pry"

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
  num = -1
  game_hash.each { |k, v|
    v[:players].each { |value|
      if value[:player_name] == player
        num = value[:points]
      end
    }
  }
  if num != -1
    num
  else
    "Player Not Found"
  end
end

def shoe_size(player)
  num = -1
  game_hash.each { |k, v|
    v[:players].each { |value|
      if value[:player_name] == player
        num = value[:shoe]
      end
    }
  }
  if num != -1
    num
  else
    "Player Not Found"
  end
end

def team_colors(team_name)
  color = []
  game_hash.each{ |k, v|
    if v[:team_name] == team_name
      color = v[:colors]
    end
  }
  if color != []
    color
  else
    "Team Is Not Found"
  end
end

def team_names
  team_name = []
  game_hash.each{ |k, v|
    team_name << v[:team_name]
  }
  team_name
end

def player_numbers(team_name)
  player_number = []
  game_hash.each { |k, v|
   if v[:team_name] == team_name
     v[:players].each { |value|
       player_number << value[:number]
     }
   end
  }
  player_number
end

def player_stats(player)
  stat = {}
  game_hash.each { |k, v| 
    v[:players].each { |i| 
      if i[:player_name] == player
        stat = i
      end
    }
  }
  stat
end

def big_shoe_rebounds
  max = 0
  rebounds = 0
  game_hash.each{ |k, v|
    v[:players].each{ |value|
      if value[:shoe] > max
        max = value[:shoe]
      end
    }
  }
  game_hash.each{ |k, v| 
    v[:players].each{ |value| 
      if value[:shoe] == max
        rebounds = value[:rebounds]
      end
    }
  }
  rebounds
end

def most_points_scored
  most_points = 0
  best_player = []
  game_hash.each{ |k, v|
    v[:players].each{ |value|
      if value[:points] > most_points
        most_points = value[:shoe]
      end
    }
    v[:players].each{ |value|
      if value[:points] == most_points
        best_player << value[:player_name]
      end
    }
  }
  best_player
end

def winning_team
  winning_point = 0
  winning_team = ""
  game_hash.each{ |k, v|
    total = 0
    v[:players].each{ |value| 
      total += value[:points]
    }
    if total > winning_point
      winning_point = total
      winning_team = v[:team_name]
    end
  }
  winning_team
end

def player_with_longest_name
  max_length = 0
  player = ""
  game_hash.each { |k, v|
    v[:players].each{ |value| 
      if value[:player_name].length > max_length
        max_length = value[:player_name].length
        player = value[:player_name]
      end
    }
  }
  player
end

def long_name_steals_a_ton
  max_length = 0
  max_length_player = ""
  most_steals = 0
  most_steals_player = ""
  game_hash.each{ |k, v|
    v[:players].each{ |value|
      if value[:player_name].length > max_length
        max_length = value[:player_name].to_s.length
        max_length_player = value[:player_name]
      end
      if value[:steals] > most_steals
        most_steals = value[:steals]
        most_steals_player = value[:player_name]
      end
    }
  }
  most_steals_player == max_length_player ? true : false
end