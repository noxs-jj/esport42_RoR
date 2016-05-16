class ParticipantStatus < ActiveRecord::Base
  ADMINISTRATIVE_CHECK = 8
  CHECKING = 7
  PAYMENT_REFUSED = 6
  REFUSED = 5
  VALIDATED = 4
  PAYMENT_PENDING = 3
  PENDING = 2
  UNKNOW = 1

  def self.list_status
    ParticipantStatus.all.map do |t|
      [t.name, t.id]
    end
  end
end
