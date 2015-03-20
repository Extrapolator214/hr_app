class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :title
      t.datetime :valid_to
      t.integer :salary_min
      t.integer :salary_max
      t.text :contact_info

      t.timestamps null: false
    end
  end
end
