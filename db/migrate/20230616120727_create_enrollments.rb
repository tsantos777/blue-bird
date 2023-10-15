class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.text :goals
      t.string :previous_training
      t.text :comments
      t.date :preferred_date
      t.string :preferred_availability
      t.date :alternate_date
      t.string :alternate_availability

      t.timestamps
    end
  end
end
