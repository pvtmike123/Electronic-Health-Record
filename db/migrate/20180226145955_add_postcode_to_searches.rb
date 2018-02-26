class AddPostcodeToSearches < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :postcode, :string
  end
end
