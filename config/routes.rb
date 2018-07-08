Rails.application.routes.draw do
  resources :scores, only: [:index] do
    collection do
      get "player_score", to: "scores#player_score"
      get "game_scores", to: "scores#game_scores"
      get "team_scores", to: "scores#team_scores"
    end
  end
  resources :teams
  resources :games
  resources :players

  root to: "games#index"
end
