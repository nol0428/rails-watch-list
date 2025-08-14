Rails.application.routes.draw do
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
  root "lists#index"
end

# resources :restaurants do
#    resources :reviews, only: [:create]
# end
