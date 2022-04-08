class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.present?

    can :read, :all
    # can :manage, Item, user: user.admin?
    can :manage, Reservation, user: user
    can :manage, User, user: user

    return unless user.admin?

    can :manage, :all
  end
end
