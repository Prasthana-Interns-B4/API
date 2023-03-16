class Ability
  include CanCan::Ability

  def initialize(user)
    if user&.facility_manager?
      can :manage,Device
      can :read,User
      can :read,UserDetail
      can :read,Role
    elsif user&.hr_manager?
      can :read,Device
    elsif user&.present?
      can :read,Device,user: user
    end
  end
end
