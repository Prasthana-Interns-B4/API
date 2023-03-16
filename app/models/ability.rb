# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role.hr_manager?
      can :manage, User, UserDetail
      can :read, Device
    elsif user.role.fr_manager
      can :manage, Device
      can :read, User
    else
      can :manage, User, UserDetail, user: user
    end
  end
end
