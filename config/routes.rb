Rails.application.routes.draw do
  get '/(:hashtag)' => 'pages#index', as: :index
  get 'search/:hashtag' => 'pages#search', defaults: { format: :json }
end
