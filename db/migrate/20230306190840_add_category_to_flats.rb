class AddCategoryToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :category, :string
  end
end
