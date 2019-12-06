class Santa::EventsController < ApplicationController
  before_action :authenticate_user!
  layout 'santa/application'
  expose :event

  def create
    event.user_id = current_user&.id
    if event.save
      validate_participants
      shuffle_participants
      redirect_to new_santa_event_path, notice: "saved"
    else
      render :new
    end
  end

  private

  def validate_participants
    participant_params.each do |participant|
      participant = event.participants.build \
        name:   participant.last["name"],
        email:  participant.last["email"]
      participant.save
    end
  end

  def shuffle_participants
    participants = event.participants.to_a.uniq.sort_by { rand }
    participants.each.with_index(1) do |participant, index|
      if index == participants.size
        participant.participant_id = participants[0].id
      else
        participant.participant_id = participants[index].id
      end
      participant.save
    end
    send_email_to_participants
  end

  def event_params
    params.require(:event).permit(:date, :location, :maximum_price, :message)
  end

  def participant_params
    params.require(:event).require(:participants_attributes)
  end

  def send_email_to_participants
    user = User.find(event.user_id)
    event.participants.each do |participant|
      destinataire = Participant.find(participant.participant_id)
      message = "Bonjour, #{participant.name} tu devras effectuer un cadeau à destinataire: #{destinataire.email}"
      raise
    end
  end

end
