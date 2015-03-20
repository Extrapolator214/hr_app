# == Schema Information
#
# Table name: applicant_skills
#
#  user_id  :integer          not null
#  skill_id :integer          not null
#

class ApplicantSkill < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :skill
end
