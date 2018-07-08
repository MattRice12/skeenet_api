Rails.application.routes.draw do
  resources :scores, only: [:index]

  resources :teams do
    get "scores", to: "scores#team_scores"
    get "players", to: "teams#players"
  end

  resources :games do
    get "scores", to: "scores#game_scores"
    get "teams", to:  "games#teams"
  end

  resources :players

  root to: "games#index"
end
