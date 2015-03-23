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
  has_many :vacancy_skills, dependent: :delete_all
  has_many :skills, through: :vacancy_skills

  scope :with_skills, ->(skill_names = nil) do
    if skill_names.blank? || !skill_names.kind_of?(Array)
      all
    else
      joins(:skills).where(skills: {name: skill_names})
    end
  end

  scope :not_expired, -> {where('valid_to > ?', Date.today)}

  def skill_list
    self.skills.map(&:name).join(',')
  end

  def skill_list=(string)
    string.split(',').each do |s|
      skill = Skill.find_or_create_by(name: s)
      self.vacancy_skills.find_or_initialize_by(skill_id: skill.id)
    end
  end

end
