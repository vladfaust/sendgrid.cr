require "http/client"
require "json"
require "./mail"

module Sendgrid
  class Client
    URL = URI.parse("https://api.sendgrid.com")

    getter client : HTTP::Client

    def initialize(@api_key : String)
      @client = HTTP::Client.new(URL)
      @client.before_request do |request|
        request.headers["Authorization"] = "Bearer #{@api_key}"
        request.headers["Content-Type"] = "application/json"
      end
    end

    def send_mail(mail : Mail)
      @client.post("/v3/mail/send", body: mail.to_json)
    end
  end
end
