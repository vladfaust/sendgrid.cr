# Sendgrid

A naive [SendGrid](https://sendgrid.com) API client implementation for [Crystal](https://crystal-lang.org/).

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  sendgrid:
    github: vladfaust/sendgrid.cr
```

## Usage

```crystal
require "sendgrid"

client = Sendgrid::Client.new("API_KEY")
mail = Sendgrid::Mail.new(
  personalizations: [Sendgrid::Mail::Personalization.new(
    to: [Sendgrid::Mail::Personalization::To.new(
      email: "user@example.com"
    )]
  )],
  from: Sendgrid::Mail::From.new(
    email: "noreply@example.com",
    name: "Test Robot"
  ),
  subject: "Test",
  content: [Sendgrid::Mail::Content.new(
    type: "text/plain",
    value: "Hello World!"
  )],
  mail_settings: Sendgrid::Mail::MailSettings.new(
    sandbox_mode: Sendgrid::Mail::MailSettings::SandboxMode.new(
      enable: true
    )
  )
)
pp client.send_mail(mail)
```

```
$ crystal example.cr
#<HTTP::Client::Response:0xdf4a10
 @body="",
 @body_io=nil,
 @computed_content_type_header=nil,
 @cookies=nil,
 @headers=
  HTTP::Headers{"Access-Control-Allow-Headers" =>
    "Authorization, Content-Type, On-behalf-of, x-sg-elas-acl",
   "Access-Control-Allow-Methods" => "POST",
   "Access-Control-Allow-Origin" => "https://sendgrid.api-docs.io",
   "Access-Control-Max-Age" => "600",
   "Connection" => "keep-alive",
   "Content-Length" => "0",
   "Content-Type" => "text/plain; charset=utf-8",
   "Date" => "#",
   "Server" => "nginx",
   "X-Message-Id" => "#",
   "X-No-CORS-Reason" =>
    "https://sendgrid.com/docs/Classroom/Basics/API/cors.html"},
 @status_code=200,
 @status_message="OK",
 @version="HTTP/1.1">
```

## Progress

Implemented endpoints:

- [x] Mail

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/vladfaust/sendgrid/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [@vladfaust](https://github.com/vladfaust) Vlad Faust - creator, maintainer
