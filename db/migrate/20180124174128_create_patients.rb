class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :forename
      t.string :surname

      t.timestamps
    end
  end
end
