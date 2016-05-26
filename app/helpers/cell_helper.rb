module CellHelper
  def cellHelper_fill_parent_and_son_id(bracket_size, cells)
    column_number = 1
    column_cells_number = bracket_size / 2
    i = 0
    i_cell_this_column = 1
    ap "POL 0"

    while i < bracket_size

      cell = get_one_cell_from_cell_id_bracket(cells, i + 1)
      son = get_one_cell_from_cell_id_bracket(cells, column_cells_number + i - (i_cell_this_column / 2) + 1)

      ap "i=#{i}"
      ap "column_cells_number=#{column_cells_number}"
      ap "i_cell_this_column=#{i_cell_this_column}"
      ap "CELL"
      ap cell[0]
      ap "SON"
      ap son
      if son.length == 1
        cell[0].cell_id_son = son[0].slot_id_cell_in_bracket
        cell[0].save
      else
        cell[0].cell_id_son = -1337
        cell[0].save
      end

      i += 1
      break if i == bracket_size - 1
      i_cell_this_column += 1
      if i_cell_this_column > column_cells_number
        column_cells_number = column_cells_number / 2
        i_cell_this_column = 1
      end
    end
    ap "POL 1"

  end

  def get_one_cell_from_cell_id_bracket(cells_array, cell_id_bracket)
    cells_array.where(slot_id_cell_in_bracket: cell_id_bracket)
  end

  def get_cells_if_bracket(bracket_id)
    result = Cell.unscoped.where(bracket_id: bracket_id).order(slot_id_cell_in_bracket: :asc)
    result
  end
end
