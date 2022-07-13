Rails.application.routes.draw do
  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      registrations: "v1/users",
      sessions: 'v1/sessions'
    }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :v1, path: "", defaults: {format: :json} do
    resources :users, only: [ :show]
  end
  # resources :sessions, only: [:create, :destroy]
end


