class CreateQuizResults < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_results do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :in_us
      t.string :program
      t.text :why_pilot
      t.string :previous_training
      t.text :wings_lift
      t.text :want_cfi
      t.text :goals
      t.boolean :schedule_visit
      t.date :preferred_date
      t.string :preferred_availability
      t.date :alternate_date
      t.string :alternate_availability
      t.text :comments

      t.timestamps
    end
  end
end
