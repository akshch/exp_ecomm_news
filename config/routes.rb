Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :products, only: [:index] do
        collection { post :import }
      end

      resources :news, only: [:index] do
        collection { post :create_news_feeds }
      end
    end
  end
end
