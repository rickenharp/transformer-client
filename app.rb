lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'bundler/setup'
require 'transformer'
require 'validate'
require 'instantiate'

class Client
  def call(input)
    validate = ::Validate.new
    instantiate = ::Instantiate.new
    worker = Transformer::Worker.new(
      validate: validate,
      instantiate: instantiate,
    )
    worker.(input)
  end
end

if $PROGRAM_NAME == __FILE__
  Application.finalize!
  client =  Client.new
  result = client.('fnord.txt')
  puts result.inspect
end
