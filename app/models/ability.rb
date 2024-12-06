class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    user.role ||= 'reader'

    can :manage, :all if user.admin?

    return unless user.reader?

    can :read, Note
  end
end
