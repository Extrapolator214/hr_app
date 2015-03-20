class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :full_name
      t.string :contact_info
      t.integer :status
      t.integer :expected_salary

      t.timestamps null: false
    end
  end
end
