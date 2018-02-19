class AddInputs1ToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :contactmethod, :string
    add_column :patients, :county, :string
    add_column :patients, :email, :string
    add_column :patients, :title, :string
    add_column :patients, :address, :string
  end
end
