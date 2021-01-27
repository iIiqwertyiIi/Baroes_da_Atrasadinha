class Movie < ApplicationRecord
  has_many :genre_movies
  has_many :genres, through: :genre_movies
  has_many :reviews
  has_one_attached :photo
end
