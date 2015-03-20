# == Schema Information
#
# Table name: vacancy_skills
#
#  vacancy_id :integer          not null
#  skill_id   :integer          not null
#

class VacancySkill < ActiveRecord::Base
  belongs_to :vacancy
  belongs_to :skill
end
