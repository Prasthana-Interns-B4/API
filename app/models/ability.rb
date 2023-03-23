class Ability
  include CanCan::Ability

  def initialize(user)
    if user&.facility_manager?
      can :manage, Device
      can :read, User
      can :read, UserDetail
      can :read, Role
    elsif user&.hr_manager?
      can :read, Device, user: user
      can :manage,User
    elsif user&.employee?
      can :show, Device, user: user
      can :read, User,id: user.id
      can :update,User,id: user.id
    end
  end
end
