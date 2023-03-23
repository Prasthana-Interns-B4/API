# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    debugger
    if user&.facility_manager?
      can :show, User
      can :show, UserDetail
      can :read, Role
      can :update, User, [:password], user: user
    elsif user&.hr_manager?
      can :manage, User
      can :update, UserDetail
      can :read, Role
      can :update, User
    elsif user&.employee? 
    
      can :show,User, id: user.id
      can :update, User,  [:password], id: user.id
      can :update, UserDetail,[:first_name, :last_name, :phone_number],user_id: user.id
    end
  end
end
