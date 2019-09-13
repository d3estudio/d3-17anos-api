Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'

  defaults format: :json do
    resources :guests, only: [:index]
    resources :checkins, only: [:index] do
      get 'create/:slug', action: :create, on: :collection
    end
  end
end
