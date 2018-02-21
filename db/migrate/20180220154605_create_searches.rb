class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :forename
      t.string :surname
      t.string :sex
      t.string :town
      t.integer :age

      t.timestamps
    end
  end
end
