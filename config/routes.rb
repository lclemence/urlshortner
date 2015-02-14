Urlshortener::Application.routes.draw do
  resources :url_shorteners

  devise_for :users

  root to: "url_shorteners#index"
  get '/:id' => 'home#index'

end
