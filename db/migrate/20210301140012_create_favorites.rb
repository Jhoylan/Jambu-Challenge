class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.string :name
      t.string :favorite
      t.string :dataType

      t.timestamps
    end
  end
end
