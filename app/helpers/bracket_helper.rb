module BracketHelper
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
