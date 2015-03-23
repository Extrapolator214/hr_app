# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w[RubyOnRails javascript coffeescript python R postgreSQL MongoDB].each {|skill| Skill.find_or_create_by(name: skill)}

Applicant.create(full_name: "Иванов Иван Иванович", contact_info: "+71234567890", skill_list: "python,MongoDB", status: :active, expected_salary: 50000)
Applicant.create(full_name: "Петров Генадий Викторович", contact_info: "test@randomdomain.com", skill_list: "RubyOnRails,javascript", status: :active, expected_salary: 100000)
Applicant.create(full_name: "Сидоров Василий Генадьевич", contact_info: "+70987654321", skill_list: "R", status: :active, expected_salary: 60000)
Applicant.create(full_name: "Степанов Иван Модестович", contact_info: "email@free.domain.net", skill_list: "Java", status: :active, expected_salary: 70000)
Applicant.create(full_name: "Ложкин Роберт Иванович", contact_info: "admin@microsoft.com", skill_list: "MongoDB,postgreSQL", status: :idle, expected_salary: 80000)
Applicant.create(full_name: "Гупта Раджеш Измаилович", contact_info: "info@india.gov", skill_list: "javascript,coffeescript", status: :active, expected_salary: 90000)

Vacancy.create(title: 'Ruby developer', valid_to: Date.today + 2.weeks, salary: 100000, contact_info: 'hr@supercompany.com', skill_list: "RubyOnRails,coffeescript,postgreSQL")
Vacancy.create(title: 'Frontend developer', valid_to: Date.today + 2.weeks, salary: 100000, contact_info: 'hr@supercompany.com', skill_list: "javascript,coffeescript,html5,css3")
Vacancy.create(title: 'Database developer', valid_to: Date.today + 2.weeks, salary: 100000, contact_info: 'hr@supercompany.com', skill_list: "mongoDB,postgreSQL")
Vacancy.create(title: 'Data analyst', valid_to: Date.today + 2.weeks, salary: 100000, contact_info: 'hr@supercompany.com', skill_list: "R,postgreSQL")