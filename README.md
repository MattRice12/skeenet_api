## Endpoints

# Games

  `games/` - index
  `games/:id` - show

# Players

  `players/` - index
  `players/:id` - show

# Teams

  `teams/` - index
  `teams/:id` - show

# Scores

  `scores/` - index
  `/scores/game_scores` - index of scores for a game
    - Requires: game_id

  `/scores/team_scores` - index of scores for a team
    - Requires: team_id

  <!-- `player_score` - show
    Requires:
      - player_id
      - team_id
      - frame_id
      - game_id -->
