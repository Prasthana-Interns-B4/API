# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user&.facility_manager?
      can :manage, Device
      can :read, User
      can :read, UserDetail
      can :read, Role
      can :update, User, [:password], user: user
    elsif user&.hr_manager?
      can :read, Device
      can :manage, User
      can :manage, UserDetail
      can :read, Role
      can :update, User, [:password]
    elsif user&.employee?
      can :read, Device, user: user
      can :read, User, user: user
      can :read, UserDetail, user: user
      can :update, User,  [:password]
      can :update, UserDetail,[:first_name, :last_name, :phone_number]
    end
  end
end
