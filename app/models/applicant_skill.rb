class ApplicantSkill < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :skill
end
