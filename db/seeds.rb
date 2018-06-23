2.times do |n|
  Game.where(number: n).first_or_create!
end

team = Team.where(name: "Thirskee Goats").first_or_create!

Game.all.each do |game|
  GameTeam.where(team_id: team.id, game_id: game.id).first_or_create!
end

Player.where(first_name: "Matt", last_name: "Rice", nickname: "Coldsnacky").first_or_create!
Player.where(first_name: "Travis", last_name: "Czerw", nickname: "HAM").first_or_create!
Player.where(first_name: "Matthew", last_name: "Giardina", nickname: "Thirsty Goatman").first_or_create!

Player.all.each do |player|
  PlayerTeam.where(team_id: team.id, player_id: player.id).first_or_create!
end

10.times do |n|
  Frame.where(number: n).first_or_create!
end

game = Game.first

Player.all.each do |player|
  Frame.all.each do |frame|
    Score.where(player_id: player.id, frame_id: frame.id, game_id: game.id, team_id: team.id, points: rand(0...90)).first_or_create!
  end
end
