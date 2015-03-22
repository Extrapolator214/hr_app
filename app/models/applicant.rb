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
  has_many :applicant_skills
  has_many :skills, through: :applicant_skills

  enum status: [:active, :idle]

  before_save :strip_spaces_from_name

  # presence is validated implicitly with the regex
  validates :full_name, format: { with: /\A\s*(\p{Cyrillic}+\s+){2}\p{Cyrillic}+\s*\z/,
                                          message: "3 слова, только кириллические символы и пробелы" }

  validate :contact_info_email_or_phone

  def strip_spaces_from_name
    self.full_name = full_name.gsub(/\s{2,}/, ' ').strip if attribute_present?(:full_name)
  end

  def contact_info_email_or_phone
    unless self.contact_info =~ /\A[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,8}\z/ || #email regex
           self.contact_info =~ /\A\+[0-9]{11}\z/ # phone number in the format +71234567890
      errors.add(:contact_info, "некорректный формат телефона или емейла")
    end
  end

end
