class Skill < ActiveRecord::Base
  has_many :applicant_skills
  has_many :vacancy_skills
  has_many :applicants, through: :applicant_skills
  has_many :vacancies, through: :vacancy_skills
end
