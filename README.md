## Endpoints

# Games

  - GET  `games/`
  - GET  `games/:id`
  - GET  `games/:game_id/teams`  - *all teams for a game*

# Players

  - GET  `players/`
  - GET  `players/:id`
  - DELETE `players/:id`
  - POST `players/`
  ```
      player: {
        :first_name -- *required*
        :last_name  -- *required*
        :nickname   -- *required*
        :email      -- *required*
      }
      player_team: {
        :team_id
      }
  ```

  - PUT `players/:id`
  ```
      player: {
        :first_name
        :last_name
        :nickname  
        :email     
      }
  ```

# Teams

  - GET  `teams/`
  - GET  `teams/:id`
  - GET  `teams/:team_id/players`  - *all players for a team*
  - DELETE `teams/:id`
  - POST `teams/`
  ```
      team: {
        :name   -- *required*
        :active
      }
  ```

  - PUT `teams/:id`
  ```
      team: {
        :name  
        :active
      }
  ```

# Scores

  - GET  `scores/`
  - GET  `games/:game_id/scores` - *index of scores for a game*
  - GET  `teams/:team_id/scores` - *index of scores for a team*
  - DELETE `scores/:id`
  - POST `scores/`
  ```
      score: {
        :player_id   -- *required*
        :frame_id    -- *required*
        :team_id     -- *required*
        :game_id     -- *required*
        :points      -- *required*
      }
  ```

  - PUT `scores/:id`
  ```
      score: {
        :player_id
        :frame_id
        :team_id  
        :game_id  
        :points   
      }
  ```
