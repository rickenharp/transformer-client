require 'dry/transaction/operation'
require 'dry/validation'
require 'json'

Dry::Validation.load_extensions(:monads)

class Validate
  include Dry::Transaction::Operation
  Schema = Dry::Validation.Form do
    required(:foo).filled
    required(:bar).filled
  end

  def call(input)
    data = JSON.parse(input)
    validated = Schema.(data)
    validated.to_either
  rescue StandardError => exception
    Left(exception)
  end
end
