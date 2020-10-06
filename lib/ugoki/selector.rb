# frozen_string_literal: true

require "set"

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

    # Initialize a selector.
    #
    # @param tablebase [Hash] A tablebase containing precalculated pseudo-legal
    #   moves of the game.
    # @param position [Ugoki::Position] The state of the game.
    def initialize(tablebase, position)
      @tablebase = tablebase
      @position = position
    end

    # Returns selected pseudo-legal moves.
    #
    # @return [Set] All pseudo-legal moves.
    def call
      selected_moves + allowed_drops
    end

    private

    # @param piece_name [String] The name of a piece.
    # @param src_square_id [Integer] The source square of the piece.
    #
    # @return [Array] A subset of the tablebase.
    def gameplays(piece_name, src_square_id)
      tablebase.fetch(piece_name).fetch(src_square_id).select do |gameplay|
        conditions = gameplay.fetch(0)
        position.match?(conditions)
      end
    end

    # List the selected moves.
    #
    # @return [Set] A list of selected moves.
    def selected_moves
      position.square_owned_pieces.inject([]) do |moves, (src_square_id, piece_name)|
        moves + gameplays(piece_name, src_square_id).flat_map do |gameplay|
          consequence = gameplay.fetch(1)
          meta_move_to_moves(consequence)
        end
      end.to_set
    end

    # Convert a meta-move into a list of moves.
    #
    # @param meta_move [Array] A meta-move.
    #
    # @example Shogi Knight move without promotion, and with promotion
    #   meta_move_to_moves([37, 20, ["S:N", "S:+N"], false])
    #   # => [[37, 20, "S:N", nil], [37, 20, "S:+N", nil]]
    #
    # @example White 0-0 move
    #   meta_move_to_moves([60, 62, ["C:-K"], false, 63, 61, ["C:R"], false])
    #   # => [[60, 62, "C:-K", nil, 63, 61, "C:R", nil]]
    #
    # @example White 0-0 move with magical optional promotion
    #   meta_move_to_moves([60, 62, ["C:-K"], false, 63, 61, ["C:R", "C:Q", "C:B"], false])
    #   # => [[60, 62, "C:-K", nil, 63, 61, "C:R", nil], [60, 62, "C:-K", nil, 63, 61, "C:Q", nil], [60, 62, "C:-K", nil, 63, 61, "C:B", nil]]
    #
    # @example White 0-0 move with magical optional promotions
    #   meta_move_to_moves([60, 62, ["C:-K", "C:+-K"], false, 63, 61, ["C:R", "C:Q"], false])
    #   # => [[60, 62, "C:-K", nil, 63, 61, "C:R", nil], [60, 62, "C:-K", nil, 63, 61, "C:Q", nil], [60, 62, "C:+-K", nil, 63, 61, "C:R", nil], [60, 62, "C:+-K", nil, 63, 61, "C:Q", nil]]
    #
    # @return [Array] A list of moves.
    def meta_move_to_moves(meta_move)
      meta_actions_moves = meta_move_to_meta_actions(meta_move)

      meta_actions_moves.map do |meta_actions|
        meta_actions.flat_map { |params| meta_action_to_action(*params) }
      end
    end

    # @param src_index [Integer] A source square.
    # @param dst_index [Integer] A target square.
    # @param moved_piece [String] A name for the moved piece.
    # @param is_capture [Boolean] Is it a capture?
    #
    # @return [Array] An action.
    def meta_action_to_action(src_index, dst_index, moved_piece, is_capture)
      captured = capture(unpromote(position.square.fetch(dst_index))) if is_capture

      [src_index, dst_index, moved_piece, captured]
    end

    # @example
    #   meta_move_to_meta_actions([60, 62, ["C:-K"], false, 63, 61, ["C:R", "C:Q", "C:B"], false])
    #   # => [[[60, 62, "C:-K", false], [63, 61, "C:R", false]], [[60, 62, "C:-K", false], [63, 61, "C:Q", false]], [[60, 62, "C:-K", false], [63, 61, "C:B", false]]]
    def meta_move_to_meta_actions(meta_move)
      meta_actions = meta_move.each_slice(4).to_a.map do |sliced_meta_move|
        promote_in_one_of_the_piece_names = sliced_meta_move.fetch(2)

        promote_in_one_of_the_piece_names.map do |moved_piece|
          [
            sliced_meta_move.fetch(0),
            sliced_meta_move.fetch(1),
            moved_piece,
            sliced_meta_move.fetch(3)
          ]
        end
      end

      meta_actions.fetch(0).product(*meta_actions[1..])
    end

    # @return [String] The name of the captured piece.
    def capture(piece_name)
      position.turn_to_topside? ? piece_name.downcase : piece_name.upcase
    end

    # @return [String] The name of the unpromoted piece.
    def unpromote(piece_name)
      piece_name.delete("+")
    end

    # @return [Set] A list of allowed drops.
    def allowed_drops
      position.in_hand_owned_pieces.inject([]) do |moves, piece_name|
        moves + gameplays(piece_name, nil).flat_map do |gameplay|
          consequence = gameplay.fetch(1)
          meta_move_to_moves(consequence)
        end
      end.to_set
    end
  end
end
