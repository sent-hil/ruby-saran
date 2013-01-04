# Saran

DSL for wrapping RESTful apis. This is a rewritten version of
[wrappable](https://github.com/sent-hil/wrappable).

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
