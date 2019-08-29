Rails.application.routes.draw do
  resources :enquetes, only: [:create, :index, :show]
end
