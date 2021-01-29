# frozen_string_literal: true

class GenreMovie < ApplicationRecord
  belongs_to :genre
  belongs_to :movie
end
