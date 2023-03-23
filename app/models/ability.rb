class Ability
  include CanCan::Ability

  def initialize(user)
    if user&.facility_manager?
      can :manage, Device
      can :read, User
			can :update, User, id: user.id
			can :reset_password, User, id: user.id
    elsif user&.hr_manager?
      can :read, Device, user: user
			can :manage, User
			can :reset_password, User, id: user.id
    elsif user&.employee?
      can :read, Device, user: user
			can :show, User, id: user.id
			can :update, User, id: user.id
			can :reset_password, User, id: user.id
    end
  end
end
