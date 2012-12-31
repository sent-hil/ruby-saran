require_relative '../lib/saran'

class Restful
  include Saran

  endpoint 'http://localhost:3000/restful'
  provider :default

  resources :resources do
    collection do
      get '/resources'
      post '/resources'
    end

    member do
      get '/resources/:id'
      put '/resources/:id'
      delete '/resources/:id'
    end
  end
end
