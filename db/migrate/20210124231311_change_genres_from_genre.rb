class ChangeGenresFromGenre < ActiveRecord::Migration[5.2]
  def change
    rename_column :genres, :genres, :name
  end
end
