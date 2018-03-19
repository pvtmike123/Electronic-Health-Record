class CreateMedicals < ActiveRecord::Migration[5.1]
  def change
    create_table :medicals do |t|
      t.string :allergies
      t.string :smoker

      t.timestamps
    end
  end
end
