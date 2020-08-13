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

def num_points_scored(name)
  game_hash.each do |place, info|
    info[:players].each do |hash|
      if hash[:player_name] == name
        return hash[:points]
      end
    end
  end
  "Player doesn't exist"
end

def shoe_size(name)
  game_hash.each do |place, info|
    info[:players].each do |hash|
      if hash[:player_name] == name
        return hash[:shoe]
      end
    end
  end
  "Player doesn't exist"
end

def team_colors(team)
  game_hash.each do |place, info|
    if info[:team_name] == team
      return info[:colors]
    end
  end
end

def team_names
  names = []
  game_hash.each do |key, value|
    names.push(value[:team_name])
  end
  names
end

def player_numbers(team)
  numbers = []
  game_hash.each do |key, value|
    if value[:team_name] == team
      value[:players].each do |player|
        numbers.push(player[:number])
      end
    end
  end
  numbers
end

def player_stats(name)
  game_hash.each do |key, value|
    value[:players].each do |player|
      if player[:player_name] == name
        return player
      end
    end
  end
end

def big_shoe_rebounds
  biggest = []
  game_hash.each do |key, value|
    value[:players].each do |player|
      if biggest == []
        biggest[0] = player[:shoe]
        biggest[1] = player[:rebounds]
      end
      if player[:shoe] > biggest[0]
        biggest[0] = player[:shoe]
        biggest[1] = player[:rebounds]
      end
    end
  end
  biggest[1]
end
      
def most_points_scored 
  points = [0]
  game_hash.each do |key, value|
    value[:players].each do |player|
      if player[:points] > points[0]
        points[0] = player[:points]
        points[1] = player[:player_name]
      end
    end
  end
  points[1]
end

def winning_team
  points = {}
  game_hash.each do |key, value|
    if !points[value[:team_name]]
      points[value[:team_name]] = 0
    end
    value[:players].each do |player|
      points[value[:team_name]] += player[:points]
    end
  end
  most = [0]
  points.each do |team, scores|
    if points[team] > most[0]
      most[0] = points[team]
      most[1] = team
    end
  end
  most[1]
end

def long_name_steals_a_ton?
  longest = [0]
  game_hash.each do |key, value|
    value[:players].each do |player|
      if player[:player_name].length > longest[0]
        longest[0] = player[:player_name].length
        longest[1] = player[:player_name]
      end
    end
  end
  steals = [0]
  game_hash.each do |key, value|
    value[:players].each do |player|
      if player[:steals] > steals[0]
        steals[0] = player[:steals]
        steals[1] = player[:player_name]
      end
    end
  end
  longest[1] == steals[1]
end