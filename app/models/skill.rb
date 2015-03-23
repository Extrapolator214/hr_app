# == Schema Information
#
# Table name: skills
#
#  id   :integer          not null, primary key
#  name :string
#

class Skill < ActiveRecord::Base
  has_many :applicant_skills
  has_many :vacancy_skills
  has_many :applicants, through: :applicant_skills
  has_many :vacancies, through: :vacancy_skills

  scope :name_starts_with, ->(search = nil) { search.blank? ? all : where("name like ?", "#{search}%") }

end
