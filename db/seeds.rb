# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

hr_manager = User.create(emp_id: "PR001", email: "hrmanager@prasthana.com", password: "Prasthana@2023", status: "active")
hr_manager.create_user_detail(first_name: "John", last_name: "Doe", phone_number: 9178124635, designation: "HR", date_of_birth: "12-05-1995")
hr_manager.create_role(role: "hr_manager")

facility_manager = User.create(emp_id: "PR002", email: "facilitymanager@prasthana.com", password: "Prasthana@2023", status: "active")
facility_manager.create_user_detail(first_name: "Smith", last_name: "John", phone_number: 9348254786, designation: "FR", date_of_birth: "25-04-1997")
facility_manager.create_role(role: "facility_manager")
