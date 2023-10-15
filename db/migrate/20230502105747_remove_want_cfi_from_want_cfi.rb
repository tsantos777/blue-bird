class RemoveWantCfiFromWantCfi < ActiveRecord::Migration[7.0]
  def change
    remove_column :quiz_results, :want_cfi, :text
    add_column :quiz_results, :learn_style, :string
    add_column :quiz_results, :structure, :string
    add_column :quiz_results, :feedback, :string
    add_column :quiz_results, :approach, :string
  end
end
