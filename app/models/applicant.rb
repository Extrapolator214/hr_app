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
  has_many :skills, through: :user_skills

  enum status: [:active, :idle]
end
