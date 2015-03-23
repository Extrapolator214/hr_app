# == Schema Information
#
# Table name: applicants
#
#  id              :integer          not null, primary key
#  full_name       :string           not null
#  contact_info    :string           not null
#  status          :integer          not null
#  expected_salary :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Applicant < ActiveRecord::Base
  has_many :applicant_skills, dependent: :delete_all
  has_many :skills, through: :applicant_skills

  enum status: [:active, :idle]

  before_save :strip_spaces_from_name

  # presence is validated implicitly with the regex
  validates :full_name, format: { with: /\A\s*(\p{Cyrillic}+\s+){2}\p{Cyrillic}+\s*\z/,
                                          message: "3 слова, только кириллические символы и пробелы" }

  validate :contact_info_email_or_phone

  scope :with_skills, ->(skill_names = nil) do
    if skill_names.blank? || !skill_names.kind_of?(Array)
      all
    else
      joins(:skills).where(skills: {name: skill_names}).uniq
    end
  end

  scope :active, -> {where(status: Applicant.statuses[:active])}

  def strip_spaces_from_name
    self.full_name = full_name.gsub(/\s{2,}/, ' ').strip if attribute_present?(:full_name)
  end

  def contact_info_email_or_phone
    unless self.contact_info =~ /\A[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,8}\z/ || #email regex
           self.contact_info =~ /\A\+[0-9]{11}\z/ # phone number in the format +71234567890
      errors.add(:contact_info, "некорректный формат телефона или емейла")
    end
  end

  def skill_list
    self.skills.map(&:name).join(',')
  end

  def skill_list=(string)
    string.split(',').each do |s|
      skill = Skill.find_or_create_by(name: s)
      self.applicant_skills.find_or_initialize_by(skill_id: skill.id)
    end
  end

end
