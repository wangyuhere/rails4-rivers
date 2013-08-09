Rivers::Application.routes.draw do

  resources :rivers

  root 'rivers#index'
end
