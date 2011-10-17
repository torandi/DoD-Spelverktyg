Dododr::Application.routes.draw do

  resources :character_skills

  resources :character_skill_levels

  resources :parties

  resources :characters

  resources :spell_trees

  resources :attributes

  resources :skill_trees

  resources :skills

  resources :user_sessions

  resources :users

  get "login" => "user_sessions#new"
  get "logout" => "user_sessions#destroy"

  root :to => "welcome#index"

end
