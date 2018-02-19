class AddInputsToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :sex, :string
    add_column :patients, :town, :string
    add_column :patients, :number, :integer
  end
end
