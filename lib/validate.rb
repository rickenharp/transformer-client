require 'dry/transaction/operation'
require 'dry/validation'
require 'json'

Dry::Validation.load_extensions(:monads)

class Validate
  include Dry::Transaction::Operation

  def call(input)
    data = JSON.parse(input)
    validated = schema.(data)
    validated.to_either
  rescue StandardError => exception
    Left(exception)
  end

  def schema
    @schema ||= Dry::Validation.Form do
      required(:foo).filled
      required(:bar).filled
    end
  end
end
