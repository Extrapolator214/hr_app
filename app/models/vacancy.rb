# == Schema Information
#
# Table name: vacancies
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  valid_to     :datetime         not null
#  salary       :integer
#  contact_info :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Vacancy < ActiveRecord::Base
  has_many :vacancy_skills
  has_many :skills, through: :vacancy_skills
end
