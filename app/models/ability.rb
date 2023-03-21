# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user&.facility_manager?
			can :read, User
			can :update,User

    elsif user&.hr_manager?
			can :read, User
			can [:read,:show], Device, user: user
			can :update,User

    elsif user&.present?
      can :read,Device,user: user
			can :update, User, id: user.id
			can :show, User, id: user.id
    end
  end
end
