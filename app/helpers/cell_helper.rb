module CellHelper
  def get_cells_if_bracket(bracket_id)
    result = Cell.unscoped.where(bracket_id: bracket_id).order(slot_id_cell_in_bracket: :asc)
    #ap result
    result
  end
end
