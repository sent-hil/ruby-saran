require_relative '../lib/saran'

class Restful
  include Saran

  endpoint 'http://localhost:3000/restful'

  resources :blogs do
    collection do
      get '/blogs'
      post '/blogs'
    end

    member do
      get '/blogs/:id'
      put '/blogs/:id'
      delete '/blogs/:id'
    end
  end
end

# collection
Restful::Blogs.new.post(:name => 'indiana')
blogs = Restful::Blogs.new
blogs.get

# member
blog = blogs.first
blog.get
blog.put(:name => 'jones')
blog.delete

blog = Restful::Blog.new(:id => '101')
blog.get
blog.put(:name => 'indy')
