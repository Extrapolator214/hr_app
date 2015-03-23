class RenameApplicantIdInApplicantSkills < ActiveRecord::Migration
  def change
    rename_column :applicant_skills, :user_id, :applicant_id
  end
end
