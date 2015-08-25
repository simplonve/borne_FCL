class Movie < ActiveRecord::Base
  def self.search_title(param_title)
    Movie.find(param_title)
  end
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
