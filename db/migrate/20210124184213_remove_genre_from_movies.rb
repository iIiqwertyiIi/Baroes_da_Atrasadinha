# frozen_string_literal: true

class RemoveGenreFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_reference :movies, :genre, foreign_key: true
  end
end
