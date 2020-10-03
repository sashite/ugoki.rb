# frozen_string_literal: true

require_relative File.join("ugoki", "position")
require_relative File.join("ugoki", "selector")

# Namespace for the Ugoki lib.
module Ugoki
  # @param base [Hash] A tablebase containing the precalculated pseudo-legal
  #   moves of the game.
  # @param feen [String] The FEEN string representing a position.
  #
  # @see https://developer.sashite.com/specs/forsyth-edwards-expanded-notation
  def self.pseudo_legal_moves(base, feen)
    position = Position.parse(feen)
    Selector.new(base, position).call
  end
end
