Rails.application.routes.draw do
  resources :scores
  resources :teams
  resources :games
  resources :players

  root to: "games#index"
end
