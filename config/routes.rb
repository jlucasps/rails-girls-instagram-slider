Rails.application.routes.draw do
  get '/(:hashtag)' => 'pages#index'
  get 'search/:hashtag' => 'pages#search', defaults: { format: :json }
end
