# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "alexa_rubyengine"
  # We'll sync Engine Version with the kit.
  spec.version       = '1.0.0'
  spec.authors       = ["Damian Finol"]
  spec.email         = ["damian.finol@gmail.com"]

  spec.summary       = "Samples for the Alexa RubyEngine."
  spec.description   = "Includes samples for developing Applications with the Echo"
  spec.homepage      = "https://github.com/damianFC/alexa_rubyengine"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = Dir['[A-Z]*'] + Dir['lib/**/*'] + Dir['tests/**'] + Dir['bin/**']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7.3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "sinatra", "~> 1.4"
end
