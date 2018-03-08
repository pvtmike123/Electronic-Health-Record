class AddUserIdToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :user_id, :integer
  end
end
