class AddDobPostcodeToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :postcode, :string
    add_column :patients, :age, :string
  end
end
