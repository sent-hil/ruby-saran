# Saran

DSL for wrapping RESTful apis.

## Config

Accepted variables: `endpoint`, `access_token`, `provider` (for OpenAuth2).

```
class GoogleCalendar
  include Wrappable

  endpoint 'https://www.googleapis.com/calendar/v3'
  provider :google
end

# getters
fb.endpoint #=> 'https://graph.facebook.com'

# setters
fb.endpoint('something else')
```
