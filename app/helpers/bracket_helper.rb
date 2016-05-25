module BracketHelper
  def bracketHelper_brackets_links_with_tournament_id(tournament_id)
    brackets = Bracket.where(tournament_id: tournament_id)
    result = ""
    i = 1

    brackets.each do |entry|
      result += '<a href="/backoffice/bracket/show/' + entry.id.to_s + '" title="' + entry.name + '">#' + i.to_s + '</a> '

      i += 1
    end

    return result
  end

  def bracketHelper_columns_from_players(players, cells, cell_entry = nil)
    if players <= 2
      bracket_size = 1
      columns = 1
    elsif players <= 4
      bracket_size = 2
      columns = 2
    elsif players <= 8
      bracket_size = 4
      columns = 3
    elsif players <= 16
      bracket_size = 8
      columns = 4
    elsif players <= 32
      bracket_size = 16
      columns = 5
    elsif players <= 64
      bracket_size = 32
      columns = 6
    elsif players <= 128
      bracket_size = 64
      columns = 7
    elsif players <= 256
      bracket_size = 128
      columns = 8
    elsif players <= 512
      bracket_size = 256
      columns = 9
    end
    space_number = 0
    i_column = 0
    first_column = true
    result = ""
    id_first_cell_of_column = 1

    while i_column < columns
      result += render partial: 'backoffice/bracket/bracket_column', locals: {
        var_cell: bracket_size,
        var_space: space_number,
        var_id_cell: id_first_cell_of_column,
        var_cell_array: cells,
        first_column: first_column,
        cell_entry: cell_entry
      }
      first_column = false;
      break if action_name == "edit_cell"
      id_first_cell_of_column += bracket_size
      bracket_size = bracket_size / 2
      space_number = (space_number * 2) + 1
      i_column += 1
    end

    return result
  end

  def bracketHelper_cells_and_spaces(cells_to_spawn, space_between_cells,
            var_id_cell, var_cell_array, first_column, cell_entry = nil)
    result  = ""
    i       = 0
    i_cell  = 0
    start   = space_between_cells / 2.0
    switch_color = 1

    if space_between_cells != 0
      result += render partial: 'backoffice/bracket/bracket_space_cell'
    end
    if start > 1.0
      while i < start - 1
          result += render partial: 'backoffice/bracket/bracket_empty_cell'
          i += 1
      end
    end
    while i_cell < cells_to_spawn
      result += render partial: 'backoffice/bracket/bracket_cell', locals: {
        id_cell: var_id_cell,
        var_set_color: switch_color,
        var_data_cell: var_cell_array[var_id_cell - 1],
        first_column: first_column,
        cell_entry: cell_entry
      }
      switch_color = (switch_color == 1)? 2 : 1
      i = 0
      while i < space_between_cells && i_cell + 1 < cells_to_spawn
          result += render partial: 'backoffice/bracket/bracket_empty_cell'
          i += 1
      end
      i_cell += 1
      var_id_cell += 1
    end

    return result
  end

  def bracketHelper_number_column_with_number_participants(participant_nbr)
    return 1 if participant_nbr <= 2
    return 2 if participant_nbr <= 4
    return 4 if participant_nbr <= 8
    return 8 if participant_nbr <= 16
    return 16 if participant_nbr <= 32
    return 32 if participant_nbr <= 64
    return 64 if participant_nbr <= 128
    return 128 if participant_nbr <= 256
    return 256 if participant_nbr <= 512

    -1
  end

  def bracketHelper_number_cell_with_number_participants(participant_nbr)
    return 1 if participant_nbr <= 2
    return 3 if participant_nbr <= 4
    return 7 if participant_nbr <= 8
    return 15 if participant_nbr <= 16
    return 31 if participant_nbr <= 32
    return 63 if participant_nbr <= 64
    return 127 if participant_nbr <= 128
    return 255 if participant_nbr <= 256
    return 511 if participant_nbr <= 512

    -1
  end
end
