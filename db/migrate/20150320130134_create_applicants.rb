class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :full_name, null:false
      t.string :contact_info, null:false
      t.integer :status, null:false
      t.integer :expected_salary

      t.timestamps null: false
    end
  end
end
