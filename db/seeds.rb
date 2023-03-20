# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
hr_manager = User.create(emp_id:"PR001",email:"satya@prasthana.com",password:"Prasthana@2023",status:"active")
hr_manager.create_user_detail(first_name:"Satya",last_name:"Maharana",phone_number:7008122098,designation:"HR-Manager",date_of_birth:"14-11-1998")
hr_manager.create_role(role:"hr_manager")

facility_manager = User.create(emp_id:"PR002",email:"sathish@prasthana.com",password:"Prasthana@2023",status:"active")
facility_manager.create_user_detail(first_name:"Sathish",last_name:"Moutam",phone_number:9603551178,designation:"Facility-Manager",date_of_birth:"24-11-2000")
facility_manager.create_role(role:"facility_manager")

