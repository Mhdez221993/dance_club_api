class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.present?

    can :read, :all
    # can :manage, Item, user: user
    can :manage, Reservation, user: user

    return unless user.admin?

    can :manage, :all
  end
end
