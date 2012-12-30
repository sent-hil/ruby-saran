# Saran

### Resources:

```
class GoogleCalendar
  include Wrappable

  endpoint 'https://www.googleapis.com/calendar/v3'
  provider :google

  resources :calendars
end

GoogleCalendar::Calendars
GoogleCalendar::Calendar
```

#### Collection:

```
class GoogleCalendar
  include Wrappable

  endpoint 'https://www.googleapis.com/calendar/v3'
  provider :google

  resources :calendars do
    collection do
      post '/calendars'
    end
  end
end

cls = GoogleCalendar::Calendars.new
cls.post(:params => '')
```

#### Member:

```
class GoogleCalendar
  include Wrappable

  endpoint 'https://www.googleapis.com/calendar/v3'
  provider :google

  resources :calendars do
    member do
      delete '/:id'
      get    '/:id'
      put    '/:id'
    end
  end
end

cal = GoogleCalendar::Calendar.new(1).get
cal.delete
cal.put(:param => '')
```

#### Nested Resources:

```
class GoogleCalendar
  include Wrappable

  endpoint 'https://www.googleapis.com/calendar/v3'
  provider :google

  resources :calendars do
    member do
      resources :events do
        collection do
          get  '/events'
          post '/events'
        end

        member do
          delete '/events/:id'
          get    '/events/:id'
        end
      end
    end
  end
end

cal  = GoogleCalendar::Calendar.new(cal_id)

# returns [event, event, event]
events = cal.events
event  = events.first

# event needs to have `id` param for following to work
event.get
event.delete
```
