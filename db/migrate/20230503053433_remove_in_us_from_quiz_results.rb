class RemoveInUsFromQuizResults < ActiveRecord::Migration[7.0]
  def change
    remove_column :quiz_results, :in_us, :boolean
    remove_column :quiz_results, :schedule_visit, :boolean
    change_column :quiz_results, :guidance, :text
  end
end
