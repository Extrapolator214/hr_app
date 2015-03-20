class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :title, null: false
      t.datetime :valid_to, null:false
      t.integer :salary
      t.text :contact_info, null:false

      t.timestamps null: false
    end
  end
end
