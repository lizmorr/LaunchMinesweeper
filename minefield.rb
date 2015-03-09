class Minefield
  attr_reader :row_count, :column_count

  def initialize(row_count, column_count, mine_count)
    @column_count = column_count
    @row_count = row_count
    @mine_count = mine_count #need to do something with this!
    @mine_locations = plant_mines
    @clear_locations = []
    @detonated_mine =[]
  end

  def plant_mines
    mine_locations = []
    until mine_locations.length == @mine_count
      location = [rand(@row_count-1),rand(@column_count-1)]
      if !mine_locations.include?(location)
        mine_locations << location
      end
    end
    mine_locations
  end

  # Return true if the cell been uncovered, false otherwise.
  def cell_cleared?(row, col)
    @clear_locations.include? [row,col]
  end

  # Uncover the given cell. If there are no adjacent mines to this cell
  # it should also clear any adjacent cells as well. This is the action
  # when the player clicks on the cell.
  def clear(row, col)
    if !@mine_locations.include?([row,col])
      @clear_locations << [row,col]
    end
  end
  #need to figure out how to check cells around

  # Check if any cells have been uncovered that also contained a mine. This is
  # the condition used to see if the player has lost the game.
  def any_mines_detonated?
    !@detonated_mines.nil?
  end

  # Check if all cells that don't have mines have been uncovered. This is the
  # condition used to see if the player has won the game.
  def all_cells_cleared?
    false
  end

  # Returns the number of mines that are surrounding this cell (maximum of 8).
  def adjacent_mines(row, col)
    0
  end

  # Returns true if the given cell contains a mine, false otherwise.
  def contains_mine?(row, col)
    if @mine_locations.include?([row,col])
      @detonated_mine << [row,col]
    end
  end
end
