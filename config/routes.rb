Rails.application.routes.draw do
  devise_for :users,
  path: '',
  path_names: {
   sign_in: 'login',
   sign_out: 'logout',
   registration: 'signup'
 },
 controllers: {
   sessions: 'sessions',
   registrations: 'registrations'
 }
 resources :tweets, only: [:index, :create]
 get 'my_followers'
end
