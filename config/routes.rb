Rails.application.routes.draw do
  resources :tasks
  
  resources :lists

  devise_for :users
  root 'todos#index'
  
  put '/tasks/:id/toggle', :to => 'tasks#toggle', :as => 'toggle'
end
