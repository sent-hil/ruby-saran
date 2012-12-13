require_relative '../lib/saran'

class GoogleCalendar
  include Wrappable

  endpoint 'https://www.googleapis.com/calendar/v3'
  provdier :google

  resources :calendar_lists do
    collection do
      post '/users/me/calendarsList'
      get  '/users/me/calendarsList', :resouce => :calendar
    end

    member do
      delete '/users/me/calendarsList/:id'
      get    '/users/me/calendarsList/:id'
      update '/users/me/calendarsList/:id'
      patch  '/users/me/calendarsList/:id'
    end
  end

  resources :calendars do
    collection do
      post '/calendars'
    end

    member do
      post   '/calendars/:id/clear'
      delete '/calendars/:id'
      get    '/calendars/:id'
      put    '/calendars/:id'
      patch  '/calendars/:id'

      resources :events do
        member do
          delete '/events/:id'
          get    '/events/:id'
          post   '/events/import'
          post   '/events'
          get    '/events/:id/instances'
          get    '/events'
          post   '/events/:id/move'
          post   '/events/quickAdd'
          put    '/events/:id'
          patch  '/events/:id'
        end
      end

      resources :acls do
        collection do
          post '/acl'
          get  '/acl'
        end

        member do
          delete '/acl/:id'
          get    '/acl/:id'
          put    '/acl/:id'
          patch  '/acl/:id'
        end
      end
    end
  end

  get  '/color'
  post '/freeBusy'

  resource :settings do
    collection do
      get '/users/me/settings'
    end

    member do
      get '/users/me/settings/:id'
    end
  end
end
