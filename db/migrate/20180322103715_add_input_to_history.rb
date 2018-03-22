class AddInputToHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :histories, :patient_id, :integer
  end
end
