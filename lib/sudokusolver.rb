require_relative 'Box'
require 'pry'

class SudokuSolver < Array
  def initialize(puzzle)
    puzzle.each_with_index do |row, row_index|
      col_index = -1
      self << row.map! { |val| Box.new(val, row_index, col_index += 1, self) }
    end
  end

  def box_lookup
    return [
      [0, 0], [0, 1], [0, 2],
      [1, 0], [1, 1], [1, 2],
      [2, 0], [2, 1], [2, 2]
    ],       [
      [3, 0], [3, 1], [3, 2],
      [4, 0], [4, 1], [4, 2],
      [5, 0], [5, 1], [5, 2]
    ],       [
      [6, 0], [6, 1], [6, 2],
      [7, 0], [7, 1], [7, 2],
      [8, 0], [8, 1], [8, 2]
    ],       [
      [0, 3], [0, 4], [0, 5],
      [1, 3], [1, 4], [1, 5],
      [2, 3], [2, 4], [2, 5]
    ],       [
      [3, 3], [3, 4], [3, 5],
      [4, 3], [4, 4], [4, 5],
      [5, 3], [5, 4], [5, 5]
    ],       [
      [6, 3], [6, 4], [6, 5],
      [7, 3], [7, 4], [7, 5],
      [8, 3], [8, 4], [8, 5]
    ],       [
      [0, 6], [0, 7], [0, 8],
      [1, 6], [1, 7], [1, 8],
      [2, 6], [2, 7], [2, 8]
    ],       [
      [3, 6], [3, 7], [3, 8],
      [4, 6], [4, 7], [4, 8],
      [5, 6], [5, 7], [5, 8]
    ],       [
      [6, 6], [6, 7], [6, 8],
      [7, 6], [7, 7], [7, 8],
      [8, 6], [8, 7], [8, 8]
    ]
  end

  def boxes
    self.flatten
  end

  def solved?
    !(boxes.map {|box| box.solved? }.include?(false))
  end

  def row(index)
    self[index]
  end

  def row_values(index)
    row(index).map { |box| box.value }
  end

  def column(index)
    self.map { |row| row[index] }
  end

  def column_values(index)
    column(index).map { |box| box.value }
  end

  def box_values(x, y)
    box_lookup.each do |box|
      return box.map {|coor| self[coor[0]][coor[1]].value} if box.include?([x,y])
    end
  end

  def solve
    boxes.each { |box| box.attempt_solution } until self.solved?
    self.map do |row|
      row.map { |box| box.value }.join + "\n"
    end.join
  end

end
