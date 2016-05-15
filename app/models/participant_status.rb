class ParticipantStatus < ActiveRecord::Base
  has_many :participants

  ADMINISTRATIVECHECK = 8
  CHECKING = 7
  PAYMENTREFUSED = 6
  REFUSED = 5
  VALIDATED = 4
  PAYMENTPENDING = 3
  PENDING = 2
  UNKNOW = 1
end
