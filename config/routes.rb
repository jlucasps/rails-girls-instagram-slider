Rails.application.routes.draw do
  root 'pages#index'
  get 'search/:hashtag' => 'pages#search', defaults: { format: :json }
end
