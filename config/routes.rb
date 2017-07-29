Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questions, except: [:index]
  resources :results, only: [:new, :create]
  resources :quests, only: [:new, :create]
  resources :rounds, only: [:new, :create, :show]
  get '/rounds/:id/next_question' => 'rounds#next_question'

  resources :users, only: [:new, :create, :show]
  get '/users/:id/my_quests' => 'users#my_quests'
end
