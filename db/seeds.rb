season = Season.where(name: "Summer", year: 2018).first_or_create!

4.times do |n|
  Game.where(week: n + 1, season_id: season.id).first_or_create!
end

10.times do |n|
  Frame.where(number: n).first_or_create!
end

thirskee = Team.where(name: "Thirskee Goats").first_or_create!
hollskee = Team.where(name: "Hollskeewood").first_or_create!

matt = Player.where(first_name: "Matt", last_name: "Rice", nickname: "Coldsnacky", email: "matt@example.com").first_or_create!
travis = Player.where(first_name: "Travis", last_name: "Czerw", nickname: "HAM", email: "travis@example.com").first_or_create!
matty_g = Player.where(first_name: "Matthew", last_name: "Giardina", nickname: "Thirsty Goatman", email: "mattyg@example.com").first_or_create!

dick = Player.where(first_name: "Dick", last_name: "Tracy", nickname: "Dick Traskee", email: "dick@example.com").first_or_create!
tom = Player.where(first_name: "Tom", last_name: "Cat", nickname: "Kitskee Cat", email: "tom@example.com").first_or_create!
jerry = Player.where(first_name: "Jerry", last_name: "Mouse", nickname: "Jerskee the Mouse", email: "jerry@example.com").first_or_create!


Game.all.each do |game|
  Team.all.each do |team|
    GameTeam.where(team_id: team.id, game_id: game.id).first_or_create!
  end
end

[dick, tom, jerry].each do |player|
  PlayerTeam.where(team_id: hollskee.id, player_id: player.id).first_or_create!
end

[matt, travis, matty_g].each do |player|
  PlayerTeam.where(team_id: thirskee.id, player_id: player.id).first_or_create!
end

game = Game.third

Team.all.each do |team|
  team.players.each do |player|
    Frame.all.each do |frame|
      Score.where(player_id: player.id, frame_id: frame.id, game_id: game.id, team_id: team.id, points: rand(15...40)).first_or_create!
    end
  end
end
