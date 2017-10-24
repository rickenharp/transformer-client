require 'dry/transaction/operation'
require 'product'


class Instantiate
  include Dry::Transaction::Operation

  def call(input)
    Right(Product.new(input))
  rescue StandardError => exception
    Left(exception)
  end
end
