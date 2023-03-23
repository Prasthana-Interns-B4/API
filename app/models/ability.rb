class Ability
  include CanCan::Ability

  def initialize(user)
    if user&.facility_manager?
      can :manage, Device
      can :read, User
      can :read, UserDetail
      can :read, Role
    elsif user&.hr_manager?
      can :show, Device, user: user
    elsif user&.present?
      can :show, Device, user: user
    end
  end
end
