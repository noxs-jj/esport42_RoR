class TournamentController < ApplicationController
  include TournamentHelper
  include BracketHelper
  include ParticipantHelper
  load_and_authorize_resource

  def show
    @tournament = Tournament.find_by(id: params[:id])
    if @tournament.nil?
      redirect_to tournament_index_path, alert: "Tournament #{params[:id].to_s} doesn't exist"
    else
      @participants = participantHelper_list_participants_from_event_id(@tournament.id)
      @brackets = bracketHelper_list_brackets_from_tournament_id(@tournament.id)
    end
  end

  def participant_register
    participant = Participant.find_by(id: params[:participant_id])
    tournament = Tournament.find_by(id: params[:id])
    if tournament.nil? || participant.nil?
      redirect_to request.headers["HTTP_REFERER"],
                  alert: "Tournament #{params[:id].to_s} or \
                  Participant #{params[:participant_id].to_s} doesn't exist"
    else
      participant.tournament_ids << tournament.id if !participant.tournament_ids.include?(tournament.id)
      participant.save
      tournament.participant_ids << participant.id if !tournament.participant_ids.include?(participant.id)
      tournament.save
      redirect_to request.headers["HTTP_REFERER"],
                  notice: "Register Tournament success"
    end
  end

  def participant_unregister
    participant = Participant.find_by(id: params[:participant_id])
    tournament = Tournament.find_by(id: params[:id])
    if tournament.nil? || participant.nil?
      redirect_to request.headers["HTTP_REFERER"],
                  alert: "Tournament #{params[:id].to_s} or \
                  Participant #{params[:participant_id].to_s} doesn't exist"
    else
      participant.tournament_ids.delete(tournament.id) if participant.tournament_ids.include?(tournament.id)
      participant.save
      tournament.participant_ids.delete(participant.id) if tournament.participant_ids.include?(participant.id)
      tournament.save
      redirect_to request.headers["HTTP_REFERER"],
                  notice: "Unregister Tournament success"
    end
  end
end
