Rails.application.routes.draw do
  get '/login' => 'pages#login', as: :login
  get '/redirect_instagram' => 'pages#redirect_instagram'
  get '/(:hashtag)' => 'pages#index', as: :index
  get 'search/:hashtag' => 'pages#search', defaults: { format: :json }
end
