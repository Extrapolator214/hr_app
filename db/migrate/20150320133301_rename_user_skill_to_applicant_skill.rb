class RenameUserSkillToApplicantSkill < ActiveRecord::Migration
  def change
    rename_table :user_skills, :applicant_skills
  end
end