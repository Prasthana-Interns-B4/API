class Ability
  include CanCan::Ability

  def initialize(user)
    if user&.facility_manager?
      can :manage, Device
      can :read, User
      can :read, Role
			can :reset_password, User, id: user.id
    elsif user&.hr_manager?
      can :show, Device, user: user
      can [:create, :read, :update, :destroy, :approve, :pending], User
			can :reset_password, User, id: user.id
    elsif user&.present?
      can :show, Device, user: user
      can :show, User,id: user.id
      can :update,User,id: user.id
			can :reset_password, User, id: user.id
    end
  end
end
