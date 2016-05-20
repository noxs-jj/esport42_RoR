class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new
    if user
      if user.admin?
        can :manage, :all
      end
    end
    can :read, Event
    can :read, Participant
    can :read, Game
    can :create, ContactUs
  end
end
