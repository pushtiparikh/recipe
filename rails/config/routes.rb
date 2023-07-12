Rails.application.routes.draw do
  if Rails.env.development?
    scope format: true, constraints: { format: /jpg|png|gif|PNG/ } do
      get '/*anything', to: proc { [404, {}, ['']] }, constraints: lambda { |request| !request.path_parameters[:anything].start_with?('rails/') }
    end
  end
  
  namespace 'api' do
    namespace 'v1' do
      resources :users
      post 'users', to: 'users#create'
      get 'users/:id', to: 'users#show'

      get 'recipes/sortByType', to: 'recipes#sortByType'
      resources :recipes

      get 'comments/commentList/:recipe_id', to: 'comments#index'
      resources :comments
    end
  end

  post 'authenticate', to: 'authentication#authenticate'
end
