class AddInputToMedicals < ActiveRecord::Migration[5.1]
  def change
    add_column :medicals, :patient_id, :string
  end
end
