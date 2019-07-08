Rails.application.routes.draw do
  get '/foods', to: 'foods#index'
  root "welcome#index"

  # get '/foods', to: 'foods#index'
end
