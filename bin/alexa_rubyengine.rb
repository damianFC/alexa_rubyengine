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
  request = AlexaRubykit.build_request(request_json)

  # We also need a response object.
  response = AlexaRubykit::Response.new

  # We can manipulate the request object.
  #
  #p "#{request.to_s}"
  #p "#{request.request_id}"

  # Response
  # If it's a launch request
  if (request.type == 'LAUNCH_REQUEST')
    # Process your Launch Request
    # Call your methods for your application here that process your Launch Request.
    response.add_speech('Ruby running ready!')
    response.add_hash_card( { :title => 'Ruby Run', :subtitle => 'Ruby Running Ready!' } )
  end

  if (request.type == 'INTENT_REQUEST')
    # Process your Intent Request
    p "#{request.slots}"
    p "#{request.name}"
    response.add_speech("I received an intent named #{request.name}?")
    response.add_hash_card( { :title => 'Ruby Intent', :subtitle => "Intent #{request.name}" } )
  end

  # Return response
  response.build_response
end
