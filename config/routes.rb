Rails.application.routes.draw do


  root 'games#index'
  resources :games, shallow: true do
    resources :rents
  end
  resources :game_categories, except: [:show]
  resources :customers
end
