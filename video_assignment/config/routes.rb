Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

post 'api/v1/library/create' => 'api/v1/libraries#create'
get 'api/v1/library/show/:id' => 'api/v1/libraries#show'
get 'api/v1/library/index' => 'api/v1/libraries#index'

end
