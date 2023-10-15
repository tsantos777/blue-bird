class RemoveWantCfiFromQuizResults < ActiveRecord::Migration[7.0]
  def change
    remove_column :quiz_results, :feedback, :string
    add_column :quiz_results, :guidance, :string
  end
end
