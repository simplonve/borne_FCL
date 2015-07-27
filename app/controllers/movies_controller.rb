class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end
	def search
		if params[:coutry] == ""
			params[:country] = nil
		end
		if params[:genre] == ""
			params[:genre] = nil
		end
		@movies = Movie.where(nil) # creates an anonymous scope
 		@movies = @movies.genre(params[:genre]) if params[:genre].present?
 		@movies = @movies.country(params[:country]) if params[:country].present?
		@other_movies = Movie.all if @movies.empty?
		render 'results'
	end
	def show
		@movie = Movie.find(params[:id])
	end
	def watch
		@movie = Movie.find(params[:id])
		line = Cocaine::CommandLine.new("vlc --fullscreen $HOME'/videos_2015/#{@movie.url}'")
		line.run
		render 'show'
	end
	def download
		@movie = Movie.find(params[:id])
		@file = open(ENV['HOME']+"/videos_2015/#{@movie.url}")
		send_file @file
	end
	
	private
	def movie_params
		params.require(:movie).permit(:filmmaker_name, :production_name, :title, :genre, :duration, :language, :subtitle, :format, :synopsis, :licence, :sharing, :url)
	end
	def filter_params
		params.permit(:filmmaker_name, :production_name, :title, :genre, :duration, :language, :subtitle, :format, :synopsis, :licence, :sharing, :url)
	end	
end