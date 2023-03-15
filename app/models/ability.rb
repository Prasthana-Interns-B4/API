# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(employee)
    if employee.role.hr_manager?
      can :manage, Employee, EmployeeDetail
      can :read, Device
    elsif employee.role.fr_manager
      can :manage, Device
      can :read, Employee
    else
      can :manage, Employee, EmployeeDetail, employee: employee
    end
  end
end
