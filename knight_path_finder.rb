require 'byebug'
require_relative 'tree_node.rb'

class KnightPathFinder

  attr_accessor :visited_positions
  attr_reader :starting_position

  MOVES = [[-1,-2],[-2,-1],[-2,1],[-1,2],[1,2],[2,1],[2,-1],[1,-2]]

  def initialize(starting_position)
    @starting_position = PolyTreeNode.new(starting_position)
    @move_tree = build_move_tree
    @visited_positions = [starting_position]
  end

  def self.valid_moves(position)
    possible_moves = MOVES.map do |array|
                      array.each_index do |index|
                        array[index] +=  position[index]
                      end
                    end

    possible_moves.reject do |array|
      array.any? { |el| el > 7 || el < 0 }
    end
  end

  def build_move_tree
    queue = [starting_position]

    until queue.empty?
      node = queue.shift
      moves = new_move_positions(starting_position.value)
      moves.each do |value|
        new_node = PolyTreeNode.new(value)
        new_node.parent = node
        queue << new_code
      end
    end
  end

  def new_move_positions(position)
    byebug
    move_set = self.class.valid_moves(position)
    uniq_move_set = move_set.reject { |move| visited_positions.include?(move) }
    visited_positions.concat(uniq_move_set)
  end



end
