# Saran

DSL for wrapping RESTful apis.

## Config

Accepted variables: `endpoint`, `access_token`, `provider` (for OpenAuth2).

```
class GoogleCalendar
  include Wrappable

  endpoint 'https://www.googleapis.com/calendar/v3'
  provdier :google
end

# getters
fb.endpoint #=> 'https://graph.facebook.com'

# setters
fb.endpoint('something else')
```

### Resources:

```
class GoogleCalendar
  include Wrappable

  endpoint 'https://www.googleapis.com/calendar/v3'
  provdier :google

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
  provdier :google

  resources :calendars do
    collection do
      get  '/calendars' # fails, expects collection of cals
      post '/calendars'
    end
  end
end

cls = GoogleCalendar::Calendars.new
cls.post(:params => '')
cls.get
```

#### Member:

```
class GoogleCalendar
  include Wrappable

  endpoint 'https://www.googleapis.com/calendar/v3'
  provdier :google

  resources :calendars do
    member do
      get    '/:id'
      delete '/:id'
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
  provdier :google

  resources :calendars do
    member do
      resources :acls do
        collection do
          post '/acl'
          get  '/acl'
        end

        member do
          get    '/:id'
          delete '/:id'
          put    '/:id'
        end
      end
    end
  end
end

cal  = GoogleCalendar::Calendar.new(cal_id)

# returns [acl, acl, acl]
acls = cal.acls
acl  = acls.first

# acl needs to have `id` param for following to work
acl.get
acl.delete
```
