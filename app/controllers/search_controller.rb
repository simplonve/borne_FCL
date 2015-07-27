class SearchController < ApplicationController
	def search
	  if params[:q].nil?
	    @movies = []
	  else
	    @movies = Movie.search params[:q]
	  end
	  render 'result'
	end
end
