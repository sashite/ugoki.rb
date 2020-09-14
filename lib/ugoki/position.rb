# frozen_string_literal: true

require "feen/parser"

module Ugoki
  class Position
    # @param feen [String] The FEEN string representing a position.
    #
    # @see https://developer.sashite.com/specs/forsyth-edwards-expanded-notation
    #
    # @return [Ugoki::Position] The state of the game.
    def self.parse(feen)
      new(**::FEEN::Parser.call(feen))
    end

    # Players are identified by a number according to the order in which they
    # traditionally play from the starting position.
    #
    # @!attribute [r] active_side_id
    #   @return [Integer] The identifier of the player who must play.
    attr_reader :active_side_id

    # The indexes of each bottom-side piece on the board.
    #
    # @!attribute [r] bottomside_pieces
    #   @return [Hash] The indexes of each bottom-side piece on the board.
    attr_reader :bottomside_pieces

    # The indexes of each top-side piece on the board.
    #
    # @!attribute [r] topside_pieces
    #   @return [Hash] The indexes of each top-side piece on the board.
    attr_reader :topside_pieces

    # The shape of the board.
    #
    # @!attribute [r] indexes
    #   @return [Array] The shape of the board.
    attr_reader :indexes

    # The list of pieces in hand owned by players.
    #
    # @!attribute [r] pieces_in_hand_grouped_by_sides
    #   @return [Array] The list of pieces in hand for each side.
    attr_reader :pieces_in_hand_grouped_by_sides

    # Initialize a position.
    #
    # @param active_side_id [Integer] The identifier of the player who must play.
    # @param board [Hash] The indexes of each piece on the board.
    # @param indexes [Array] The shape of the board.
    # @param pieces_in_hand_grouped_by_sides [Array] The list of pieces in hand
    #   grouped by players.
    #
    # @example Dump a classic Tsume Shogi problem
    #   new(
    #     "active_side_id": 0,
    #     "board": {
    #        3 => "s",
    #        4 => "k",
    #        5 => "s",
    #       22 => "+P",
    #       43 => "+B"
    #     },
    #     "indexes": [9, 9],
    #     "pieces_in_hand_grouped_by_sides": [
    #       %w[S],
    #       %w[r r b g g g g s n n n n p p p p p p p p p p p p p p p p p]
    #     ]
    #   )
    def initialize(active_side_id:, board:, indexes:, pieces_in_hand_grouped_by_sides:)
      @active_side_id = active_side_id % pieces_in_hand_grouped_by_sides.length
      @bottomside_pieces = board.select { |_, name| name.upcase == name }
      @topside_pieces = board.select { |_, name| name.downcase == name }
      @indexes = indexes
      @pieces_in_hand_grouped_by_sides = pieces_in_hand_grouped_by_sides
      @columns = (0...indexes.fetch(1)).map { |i| (i...length).step(indexes.fetch(1)).to_a }
    end

    # @return [Hash] The indexes of each piece on the board.
    def board
      bottomside_pieces.merge(**topside_pieces)
    end

    # The list of pieces on the board owned by the current player, with squares.
    #
    # @return [Hash] Top-side's pieces if turn to topside, bottom-side's ones
    #   otherwise.
    def pieces
      turn_to_topside? ? topside_pieces : bottomside_pieces
    end

    # @return [Array] The list of squares on the board.
    def squares
      ::Array.new(length) { |i| board.fetch(i, nil) }
    end

    def find_column_square_ids(square_id)
      @columns.find { |square_ids| square_ids.include?(square_id) }
    end

    def list_of_pieces(*square_ids)
      square_ids.map { |square_id| squares.fetch(square_id) }.compact.to_set
    end

    def same_piece_present_in_column?(piece_name, index)
      square_ids = find_column_square_ids(index)
      list_of_pieces(*square_ids).include?(piece_name)
    end

    def turn_to_topside?
      !active_side_id.zero?
    end

    # The list of pieces in hand owned by the current player.
    #
    # @return [Array] The list of pieces in hand of the active side.
    def in_hand_pieces
      pieces_in_hand_grouped_by_sides.fetch(active_side_id)
    end

    def free_square_ids
      all_square_ids - occupied_square_ids
    end

    def occupied_square_ids
      board.keys
    end

    def all_square_ids
      (0...length).to_a
    end

    # @example
    #   { 10 => :free, 20 => :free, 30 => :free, 40 => :free, 50 => :free, 60 => :free, 70 => :free }
    #
    # @return [Boolean] Is the position matching the given pattern?
    def match?(**square_patterns)
      square_patterns.all? { |square_id, state| correct?(square_id, state) }
    end

    protected

    def correct?(square_id, state)
      square = board.fetch(square_id, nil)

      return state == :free if square.nil?

      if state == :enemy
        return (turn_to_topside? ? square.upcase == square : square.downcase == square)
      end

      true
    end

    def length
      indexes.inject(:*)
    end
  end
end
