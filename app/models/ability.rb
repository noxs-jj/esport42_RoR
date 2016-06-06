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
    can :read, Tournament
    can :read, Game
    can :read, Bracket
    can :read, Cell
    can :read, Post
    can :read, Page
    can :read, MenuCategory
    can :create, ContactUs
  end
end
