# Alexa RubyEngine
# This Engine receives and responds to Amazon Echo's (Alexa) JSON requests.
require 'sinatra'
require 'json'
require 'bundler/setup'
require 'alexa_rubykit'

# We must return application/json as our content type.
before do
  content_type('application/json')
end

#enable :sessions
post '/' do
  # Check that it's a valid Alexa request
  request_json = JSON.parse(request.body.read.to_s)
  # Creates a new Request object with the request parameter.
  request = AlexaRubykit::Request.new(request_json)

  # Response
  response = AlexaRubykit::Response.new
  response.add_speech('Ruby is running ready!')
  response.build_response
end
