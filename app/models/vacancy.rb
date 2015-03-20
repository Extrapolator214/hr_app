class Vacancy < ActiveRecord::Base
  has_many :vacancy_skills
  has_many :skills, through: :vacancy_skills
end
