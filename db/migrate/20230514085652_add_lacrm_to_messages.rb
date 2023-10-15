class AddLacrmToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :lacrm_contact_id, :string
    add_column :messages, :lacrm_response_code, :string
    add_column :messages, :lacrm_response_body, :text
  end
end
