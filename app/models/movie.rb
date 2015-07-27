class Movie < ActiveRecord::Base
  scope :genre, -> (genre) { where genre: genre }
  scope :country, -> (country) { where country: country }
end
