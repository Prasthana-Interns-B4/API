# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    debugger
    if user&.facility_manager?
      can :read, Role
      can :update, User,user: user
    elsif user&.hr_manager?
      can :manage, User
    elsif user&.employee? 
      can :show,User, id: user.id
      can :update, User, id: user.id
    end
  end
end
