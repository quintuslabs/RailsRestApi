Rails.application.routes.draw do
 
  resources :movies

  root 'movies#index'

  namespace 'api' do
      namespace 'v1' do
        resources :movies 
      end
  end
end
