# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.datetime :date
      t.integer :score
      t.string :director
      t.text :description
      t.text :trailer

      t.timestamps
    end
  end
end
