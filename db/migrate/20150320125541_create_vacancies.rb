class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :title
      t.datetime :valid_to
      t.integer :salary
      t.text :contact_info

      t.timestamps null: false
    end
  end
end
