class CreateVacancySkills < ActiveRecord::Migration
  def change
    create_join_table :vacancies, :skills, table_name: :vacancy_skills
  end
end
