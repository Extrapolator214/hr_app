class Applicant < ActiveRecord::Base
  has_many :applicant_skills
  has_many :skills, through: :user_skills

  enum status: [:active, :idle]
end
