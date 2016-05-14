class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def organizer?
    return true if self.organizer == true
    false
  end

  def referee?
    return true if self.referee == true
    false
  end

  def volunteer?
    return true if self.volunteer == true
    false
  end
end
