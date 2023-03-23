class Ability
  include CanCan::Ability

  def initialize(user)
    if user&.facility_manager?
      can :manage, Device
      can :read, User
      can :read, UserDetail
      can :read, Role
			can :reset_password, User, id: user.id
    elsif user&.hr_manager?
      can :show, Device, user: user
			can :reset_password, User, id: user.id
			can [:create,:read,:update,:destroy,:pending,:approve],User
    elsif user&.employee?
      can :show, Device, user: user
      can :show, User,id: user.id
      can :update,User,id: user.id
			can :reset_password, User, id: user.id
    end
  end
end
