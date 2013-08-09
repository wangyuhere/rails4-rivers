Rivers::Application.routes.draw do

  resources :rivers do
    member do
      get 'fetch'
    end
  end

  root 'rivers#index'
end
