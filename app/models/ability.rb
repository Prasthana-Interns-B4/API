# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(employee)
    if employee.facility_manager?


    elsif employee.hr_manager?


    elsif employee.present?
      can :read,Device,employee: employee
			can :reset_password, Employee, employee: employee
    end
  end
end
