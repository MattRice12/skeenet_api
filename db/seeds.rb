season = Season.where(name: "Summer", year: 2018).first_or_create!

10.times do |n|
  Game.where(week: n + 1, season_id: season.id).first_or_create!
end

10.times do |n|
  Frame.where(number: n).first_or_create!
end

thirskee = Team.where(name: "Thirskee Goatse").first_or_create!
hollskee = Team.where(name: "Hollskeewood").first_or_create!
jedi = Team.where(name: "The Jedi Skeeballion").first_or_create!
droids = Team.where(name: "Balls of Steel").first_or_create!

matt = Player.where(first_name: "Matt", last_name: "Rice", nickname: "Coldsnacky", email: "matt@example.com").first_or_create!
travis = Player.where(first_name: "Travis", last_name: "Czerw", nickname: "HAM", email: "travis@example.com").first_or_create!
matty_g = Player.where(first_name: "Matthew", last_name: "Giardina", nickname: "Thirsty Goatman", email: "mattyg@example.com").first_or_create!

dick = Player.where(first_name: "Dick", last_name: "Tracy", nickname: "Dick Traskee", email: "dick@example.com").first_or_create!
tom = Player.where(first_name: "Tom", last_name: "Cat", nickname: "Kitskee Cat", email: "tom@example.com").first_or_create!
jerry = Player.where(first_name: "Jerry", last_name: "Mouse", nickname: "Jerskee the Mouse", email: "jerry@example.com").first_or_create!

luke = Player.where(first_name: "Luke", last_name: "Skywalker", nickname: "Luke Skeewalker", email: "luke@example.com").first_or_create!
obiwan = Player.where(first_name: "Obiwan", last_name: "Kenobi", nickname: "Obiwan Skeenobi", email: "obiwan@example.com").first_or_create!
mace = Player.where(first_name: "Mace", last_name: "Windu", nickname: "Mace Skeendu", email: "mace@example.com").first_or_create!


c3po = Player.where(first_name: "C", last_name: "3PO", nickname: "Skee3PO", email: "3po@example.com").first_or_create!
r2d2 = Player.where(first_name: "R2", last_name: "D2", nickname: "R2Skee2", email: "lowballa@example.com").first_or_create!
bb8 = Player.where(first_name: "BB", last_name: "8", nickname: "SkeeSkee8", email: "rollout@example.com").first_or_create!


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

[luke, obiwan, mace].each do |player|
  PlayerTeam.where(team_id: jedi.id, player_id: player.id).first_or_create!
end
[c3po, r2d2, bb8].each do |player|
  PlayerTeam.where(team_id: droids.id, player_id: player.id).first_or_create!
end

Game.all.each do |game|
  Team.all.each do |team|
    team.players.each do |player|
      Frame.all.each do |frame|
        Score.where(player_id: player.id, frame_id: frame.id, game_id: game.id, team_id: team.id, points: rand(15...40)).first_or_create!
      end
    end
  end
end
