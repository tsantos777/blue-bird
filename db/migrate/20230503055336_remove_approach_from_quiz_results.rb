class RemoveApproachFromQuizResults < ActiveRecord::Migration[7.0]
  def change
    remove_column :quiz_results, :approach, :string
  end
end
