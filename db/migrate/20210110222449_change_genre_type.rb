# frozen_string_literal: true

class ChangeGenreType < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies, :genre, foreign_key: true
  end
end
