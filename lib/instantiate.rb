require 'dry/transaction/operation'
require 'product'


class Instantiate
  include Dry::Transaction::Operation

  def call(input)
    Success(Product.new(input.to_h))
  rescue StandardError => exception
    Failure(exception)
  end
end
