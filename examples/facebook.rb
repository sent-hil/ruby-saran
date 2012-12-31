require_relative '../lib/saran'

class Facebook
  include Saran

  endpoint 'https://graph.facebook.com'
  provider :facebook

  resources :users do
    member do
      get '/:id' do
        get  '/albums'
        get  '/apprequests'
        post '/apprequests'
        get '/events', :resource => :events
      end
    end
  end

  resources :events do
    member do
      get    '/:id'
      delete '/:id'
    end
  end

  resources :pages do
    member do
      get '/:id' do
        get '/events'
      end
    end
  end
end

# These are the methods the above dsl will generate.
# Ever get, post, delete accept parameters that will
# be url encoded and sent to the external api.
user  = Facebook::User.new(user_id).get
user.albums.get
user.apprequests.get
user.apprequests.post

user.events
event = user.events.first
event.post
event.delete

page = Facebook::Page.new(page_id).get
event = page.events.first
event.post
event.delete

event = Facebook::Event.new(event_id).get
event.delete
