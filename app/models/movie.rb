class Movie < ActiveRecord::Base
  scope :genre, -> (genre) { where genre: genre }
  scope :country, -> (country) { where country: country }
  def self.search_tags(param_tags)
  	movies_by_tag = []
  	Movie.all.each do |m|
  		if (m.tags.present?) && (m.tags.include? param_tags) 
  			movies_by_tag << m
  		end
  	end
  	movies_by_tag
  end
end
