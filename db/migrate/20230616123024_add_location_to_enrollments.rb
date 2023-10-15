class AddLocationToEnrollments < ActiveRecord::Migration[7.0]
  def change
    add_column :enrollments, :location, :string
  end
end
