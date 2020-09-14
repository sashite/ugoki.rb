# frozen_string_literal: true

module Ugoki
  # The selector class.
  #
  # @see https://developer.sashite.com/specs/general-actor-notation
  class Selector
    # @!attribute [r] tablebase
    #   @return [Hash] A tablebase containing precalculated pseudo-legal moves
    #     of the game.
    attr_reader :tablebase

    # @!attribute [r] position
    #   @return [Ugoki::Position] The state of the game.
    attr_reader :position

    # @param tablebase [Hash] A tablebase containing precalculated pseudo-legal
    #   moves of the game.
    # @param position [Ugoki::Position] The state of the game.
    def initialize(tablebase, position)
      @tablebase = tablebase
      @position = position
    end

    # returns selected pseudo-legal moves.
    #
    # @return [Set] All pseudo-legal moves.
    def call
      possible_moves + possible_drops
    end

    private

    def gameplays(piece_name, src_square_id)
      tablebase.fetch(piece_name).fetch(src_square_id).select do |gameplay|
        conditions = gameplay.fetch(0)
        position.match?(**conditions)
      end
    end

    def possible_moves
      position.pieces.inject([]) do |moves, (src_square_id, piece_name)|
        moves + gameplays(piece_name, src_square_id).flat_map do |gameplay|
          consequence = gameplay.fetch(1)
          meta_move_to_moves(*consequence)
        end
      end.to_set
    end

    # @param src_index [Integer] A source square.
    # @param dst_index [Integer] A target square.
    # @param promote_in_one_of_the_piece_names [Array] A new name for the piece.
    # @param is_capture [Boolean] Is it a capture?
    #
    # @example
    #   meta_move_to_moves(*[0, 70, ["S:+B"], false])
    def meta_move_to_moves(src_index, dst_index, promote_in_one_of_the_piece_names, is_capture)
      captured = capture(unpromote(position.board.fetch(dst_index))) if is_capture

      promote_in_one_of_the_piece_names.map do |promote_in_one_of_the_piece_name|
        [src_index, dst_index, promote_in_one_of_the_piece_name, captured]
      end
    end

    def capture(piece_name)
      position.turn_to_topside? ? piece_name.downcase : piece_name.upcase
    end

    def unpromote(piece_name)
      piece_name.delete("+")
    end

    def possible_drops
      moves = []

      position.free_square_ids.each do |free_square_id|
        position.in_hand_pieces.each do |piece_hand|
          next if position.same_piece_present_in_column?(piece_hand, free_square_id)

          moves << [nil, free_square_id, piece_hand, nil]
        end
      end

      moves.to_set
    end
  end
end
