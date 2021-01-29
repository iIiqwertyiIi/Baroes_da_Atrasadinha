# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :genre_movies
  has_many :genres, through: :genre_movies
  has_many :reviews
  has_one_attached :photo
  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
