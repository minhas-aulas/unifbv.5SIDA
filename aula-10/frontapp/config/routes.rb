Rails.application.routes.draw do
  get 'containers', to: "containers#index"
  get 'containers/new', to: "containers#new"
  post 'containers', to: "containers#create"
  get 'containers/:id', to: "containers#show"
  put 'containers/:id', to: "containers#update"
  get 'containers/:id/edit', to: "containers#edit"
  delete 'containers/:id', to: "containers#destroy"
end
