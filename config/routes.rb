Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "pages#home"
  resources :flats, except: :index do
    resources :bookings
    resources :comments
  end
end
