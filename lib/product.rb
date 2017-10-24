require 'types'

class Product < Dry::Struct
  attribute :foo, Types::Coercible::String
  attribute :bar, Types::Coercible::String
end
