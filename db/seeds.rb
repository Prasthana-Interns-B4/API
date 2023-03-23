# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

hr_manager = User.create(emp_id:"PR001",email:"swathi@prasthana.com",password:"Prasthana@2023",status:"active")
hr_manager.create_user_detail(first_name:"Swathi",last_name:"nil",phone_number: 7780152057,designation:"HR",date_of_birth:"16/03/1996")
hr_manager.create_role(role:"hr_manager")
hr_manager.devices.create(name:"Lenovo-ideapad",device_type:"laptop",os:"windows",category:"electronics")
hr_manager.devices.create(name:"iphone-14",device_type:"mobile",os:"ios",category:"electronics")



facility_manager = User.create(emp_id:"PR002",email:"shiva@prasthana.com",password:"Prasthana@2023",status:"active")
facility_manager.create_user_detail(first_name:"Shiva",last_name:"nil",phone_number: 8179364599,designation:"facility_manager",date_of_birth:"16/03/1989")
facility_manager.create_role(role:"facility_manager")
facility_manager.devices.create(name:"Lenovo-ideapad",device_type:"laptop",os:"windows",category:"electronics")
facility_manager.devices.create(name:"iphone-14Promax",device_type:"mobile",os:"ios",category:"electronics")


