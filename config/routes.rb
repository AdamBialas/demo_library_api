Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :authors do
        resources :books do
          member do
            post :cover, to: "books#book_cover_set"
            delete :cover, to: "books#book_cover_clear"
          end
        end
      end
      resources :books, only: [:index, :show] do
        member do
          get :cover, to: "books#book_cover_get"
        end
      end
    end
  end
end
