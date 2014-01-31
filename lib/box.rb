class Box

  attr_reader :value

  def all_options
    [1,2,3,4,5,6,7,8,9]
  end

  def initialize(value, x, y, puzzle)
    @value = value
    @x = x
    @y = y
    @puzzle = puzzle
  end

  def solved?
    @value != 0
  end

  def row_member_values
    @puzzle.row_values(@x)
  end

  def column_member_values
    @puzzle.column_values(@y)
  end

  def box_member_values
    @puzzle.box_values(@x, @y)
  end

  def options
    current_taken_values = row_member_values << column_member_values << box_member_values
    current_taken_values.flatten!.uniq!.sort!.delete(0)
    all_options - current_taken_values
  end

  def attempt_solution
    return if @value != 0
    if options.length == 1
      @value = options.first
    end
  end

end
