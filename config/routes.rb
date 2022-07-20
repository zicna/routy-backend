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
  
  namespace :v1, path: "", defaults: {format: :json} do
    resources :users, only: [ :show, :destroy]
    resources :routes, only: [ :create, :destroy]

  end
end


