# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

hr_manager = User.create(emp_id:"PR001",email:"jason@prasthana.com",password:"Prasthana@2023",status:"active")
hr_manager.create_user_detail(first_name:"Jason",last_name:"Phill",phone_number: 7780152057,designation:"HR",date_of_birth:"03/12/1991")
hr_manager.create_role(role:"hr_manager")


facility_manager = User.create(emp_id:"PR002",email:"naveen@prasthana.com",password:"Prasthana@2023",status:"active")
facility_manager.create_user_detail(first_name:"Naveen Kumar",last_name:"Bandala",phone_number: 8179364599,designation:"facility_manager",date_of_birth:"16/03/1989")
facility_manager.create_role(role:"facility_manager")

employee = User.create(emp_id:"PR003",email:"ramesh@prasthana",password:"Prasthana@2023",status:"active")
employee.create_user_detail(first_name:"Ramesh",last_name:"Nayak",phone_number: 7896541234,designation:"employee",date_of_birth:"30/09/1998")
employee.create_role(role:"employee")