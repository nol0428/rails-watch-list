Rails.application.routes.draw do
  root to: "lists#index"

  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :bookmarks, only: [:destroy]
end

# resources :restaurants do
#    resources :reviews, only: [:create]
# end
