# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user&.facility_manager?
      can :show, User
      can :show, UserDetail
      can :read, Role
      can :update, User, [:password], user: user
    elsif user&.hr_manager?
      can :manage, User
      can :update, UserDetail,[:first_name, :last_name, :phone_number,:date_of_birth]
      can :read, Role
      can :update, User, [:password]
    elsif user&.employee? 
      can :read,User, id: user.id
      can :read, UserDetail, user_id: user.id
      can :update, User,  [:password],id: user.id
      can :update, UserDetail,[:first_name, :last_name, :phone_number],user_id: user.id
    end
  end
end
