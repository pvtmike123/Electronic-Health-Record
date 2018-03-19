class AddInputInformationToMedicals < ActiveRecord::Migration[5.1]
  def change
    add_column :medicals, :drug, :string
    add_column :medicals, :blood, :string
    add_column :medicals, :diabetes, :string
    add_column :medicals, :pregnant, :string
    add_column :medicals, :asthma, :string
    add_column :medicals, :sti, :string
    add_column :medicals, :Hayfever, :string
  end
end
