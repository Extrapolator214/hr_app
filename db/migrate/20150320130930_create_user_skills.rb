class CreateUserSkills < ActiveRecord::Migration
  def change
    create_join_table :users, :skills, table_name: :user_skills
  end
end
