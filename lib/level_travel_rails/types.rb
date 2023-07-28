# frozen_string_literal: true

require 'dry-types'

module LevelTravelRails
  module Types
    include Dry.Types()

    StrippedString = Types::Strict::String.constructor(&:strip)
    ArrayOfIntegers = Types.Array(Types::Coercible::Integer)
  end
end