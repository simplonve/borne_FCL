class Movie < ActiveRecord::Base
  def self.search_param(param)
    search_title(param[:title]) if param[:title] != nil
    search_tags(param[:tag]) if param[:tag] != nil
  end
  def self.search_title(param_title)
    movie_by_title = Movie.find(param_title)
    return movie_by_title
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
