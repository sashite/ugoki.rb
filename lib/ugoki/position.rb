# frozen_string_literal: true

require "feen/parser"
require "set"

module Ugoki
  # The position abstraction.
  class Position
    # @param feen [String] The FEEN string representing a position.
    #
    # @see https://developer.sashite.com/specs/forsyth-edwards-expanded-notation
    #
    # @return [Ugoki::Position] The state of the game.
    def self.parse(feen)
      new(**::FEEN::Parser.call(feen))
    end

    # The list of pieces in hand.
    #
    # @!attribute [r] in_hand
    #   @return [Array] The list of pieces in hand.
    attr_reader :in_hand

    # The list of pieces in hand owned by players.
    #
    # @!attribute [r] in_hand_owned_pieces
    #   @return [Array] The list of pieces in hand for the current side.
    attr_reader :in_hand_owned_pieces

    # The shape of the board.
    #
    # @!attribute [r] shape
    #   @return [Array] The shape of the board.
    attr_reader :shape

    # Players are identified by a number according to the order in which they
    # traditionally play from the starting position.
    #
    # @!attribute [r] side_id
    #   @return [Integer] The identifier of the player who must play.
    attr_reader :side_id

    # The index of each piece on the board.
    #
    # @!attribute [r] square
    #   @return [Hash] The index of each piece on the board.
    attr_reader :square

    # The index of each bottom-side piece on the board.
    #
    # @!attribute [r] square_bottomside_pieces
    #   @return [Hash] The index of each bottom-side piece on the board.
    attr_reader :square_bottomside_pieces

    # The index of each top-side piece on the board.
    #
    # @!attribute [r] square_topside_pieces
    #   @return [Hash] The index of each top-side piece on the board.
    attr_reader :square_topside_pieces

    # The number of squares on the board.
    #
    # @!attribute [r] squares_count
    #   @return [Integer] The number of squares on the board.
    attr_reader :squares_count

    # Initialize a position.
    #
    # @param in_hand [Array] The list of pieces in hand.
    # @param shape [Array] The shape of the board.
    # @param side_id [Integer] The identifier of the player who must play.
    # @param square [Hash] The index of each piece on the board.
    #
    # @example Dump a classic Tsume Shogi problem
    #   new(
    #     "in_hand": [S r r b g g g g s n n n n p p p p p p p p p p p p p p p p p],
    #     "shape": [9, 9],
    #     "side_id": 0,
    #     "square": {
    #        3 => "s",
    #        4 => "k",
    #        5 => "s",
    #       22 => "+P",
    #       43 => "+B"
    #     }
    #   )
    def initialize(in_hand:, shape:, side_id:, square:)
      @in_hand = in_hand
      @shape = shape
      @side_id = side_id
      @square = square

      @square_bottomside_pieces = square.select { |_, name| name.upcase == name }
      @square_topside_pieces = square.select { |_, name| name.downcase == name }

      @squares_count = shape.inject(:*)

      @columns = (0...shape.fetch(1)).map do |i|
        (i...squares_count).step(shape.fetch(1)).to_a
      end

      @in_hand_owned_pieces = if turn_to_topside?
                                in_hand.select { |name| name.downcase == name }
                              else
                                in_hand.select { |name| name.upcase == name }
                              end
    end

    # The list of pieces on the board owned by the current player, with squares.
    #
    # @return [Hash] Top-side's pieces if turn to topside, bottom-side's ones
    #   otherwise.
    def square_owned_pieces
      turn_to_topside? ? square_topside_pieces : square_bottomside_pieces
    end

    # @return [Array] The list of squares on the board.
    def board_squares
      ::Array.new(squares_count) { |i| square_content(i) }
    end

    def find_column_square_ids(square_id)
      @columns.find { |square_ids| square_ids.include?(square_id) }
    end

    def set_of_pieces(square_ids)
      square_ids.map { |square_id| square.fetch(square_id) }.compact.to_set
    end

    # @return [Boolean] Is the same piece present on the column?
    def same_piece_present_in_column?(piece_name, index)
      square_ids = find_column_square_ids(index)
      set_of_pieces(square_ids).include?(piece_name)
    end

    # @return [Boolean] Is turn to top-side?
    def turn_to_topside?
      !side_id.zero?
    end

    # @return [Array] The list of ID of the free squares of the board.
    def free_square_ids
      all_square_ids - occupied_square_ids
    end

    # @return [Array] The list of ID of the occupied squares of the board.
    def occupied_square_ids
      square.keys
    end

    # @return [Array] The list of ID of the squares of the board.
    def all_square_ids
      (0...squares_count).to_a
    end

    # @param square_patterns [Hash] A hash of integers and symbols.
    #
    # @example A hash of square patterns
    #   { 10 => :free, 20 => :free, 30 => :free, 40 => :free, 50 => :free, 60 => :free, 70 => :free }
    #
    # @return [Boolean] Is the position matching the given pattern?
    def match?(square_patterns)
      square_patterns.all? { |square_id, state| correct?(square_id, state) }
    end

    protected

    # @param square_id [Integer] The square ID.
    # @param state [Symbol] The state of the square.
    #
    # @return [Boolean] Is the state of the square is correct?
    def correct?(square_id, state)
      content = square_content(square_id)

      if state == :free
        content.nil?
      elsif state == :occupied
        !content.nil?
      elsif state == :enemy
        if turn_to_topside?
          !content.nil? && content.upcase == content
        else
          !content.nil? && content.downcase == content
        end
      else
        raise ::NotImplementedError, state.inspect
      end
    end

    # @param square_id [Integer] The square ID.
    #
    # @return [String, nil] The square content.
    def square_content(square_id)
      square.fetch(square_id, nil)
    end
  end
end
