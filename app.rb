lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'bundler/setup'
require 'transformer'
require 'instantiate'
require 'validate'

class Client
  def call(input)
    worker = Transformer::Worker.new
    worker.(input)
  end
end

if $PROGRAM_NAME == __FILE__
  Transformer::Application.register(:validate) { Validate.new }
  Transformer::Application.register(:instantiate) { Instantiate.new }
  Transformer::Application.finalize!
  client =  Client.new
  result = client.('fnord.txt')
  puts result.inspect
end
