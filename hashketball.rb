# Write your code here!
require "pry"
 def game_hash 
 { 
     home: {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {
      "Alan Anderson" => {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1,
      },
      "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7,
      },
        "Brook Lopez" => {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15,
      },
      "Mason Plumlee" => {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5,
      },
      "Jason Terry" => {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals:4,
        blocks: 11,
        slam_dunks: 1,
       }
    }
   },
    away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: {
      "Jeff Adrien" => {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2,
      },
      "Bismack Biyombo" => {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10,
      },
        "DeSagna Diop" => {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5,
      },
      "Ben Gordon" => {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0,
      },
      "Brendan Haywood" => {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals:22,
        blocks: 5,
        slam_dunks: 12,
      }
     }
   }
}
end


def num_points_scored(player)
  game_hash.each do |team, attribute|
    attribute.each do |attribute, baller|
      if attribute == :players && baller[player]
        return baller[player][:points]
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |team, attribute|
    attribute.each do |attribute, baller|
     if attribute == :players && baller[player]
        return baller[player][:shoe]
        end
      end
    end
end

def team_colors(team)
  game_hash.each do |homeoraway, attributes|
    # binding.pry
    if attributes[:team_name] == team
      return  game_hash[homeoraway][:colors]
      end
  end
end

def team_names
  teamnames = []
    teamnames<< game_hash[:home][:team_name] 
    teamnames<< game_hash[:away][:team_name] 
  return teamnames
 end
 
def player_stats(player)
  game_hash.each do |team, attribute|
    attribute.each do |attribute, baller|
     if attribute == :players && baller[player]
        return baller[player]
        end
      end
    end
end
 
def player_numbers(team_name)
 team = game_hash.values.find{|team| team.fetch(:team_name) == team_name}
   team[:players].map do |attribute, stats|
   stats[:number] 
  end
 end
# def player_numbers(team)
#   # player_number_list = []
#   # game_hash.each do |team, attribute|
#   #   attribute.each do |attributes, baller|
#   #     # binding.pry
#   #   if team == :teamname 
#   #       return player_number_list << baller[player][:number]
#   #       end
#   #     end
#   #   end
# end



def big_shoe_rebounds
  player_biggest_shoe_size.fetch(:rebounds)
end

def players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def player_biggest_shoe_size
  players.max_by{|player, stats| stats.fetch(:shoe)}[1]
end
  
   