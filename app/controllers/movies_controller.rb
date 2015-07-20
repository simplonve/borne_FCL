class MoviesController < ApplicationController
	def index
		if params[:genre] == ""
			params[:genre] = nil
		end
		@movies = Movie.where(filter_params.compact)
		@other_movies = Movie.all if @movies.empty?
	end
	def show
		@movie = Movie.find(params[:id])
	end
	def watch
		@movie = Movie.find(params[:id])
		line = Cocaine::CommandLine.new("vlc --fullscreen '/home/math/videos_2015/#{@movie.url}'")
		line.run
		render 'show'
	end
	def download
		@movie = Movie.find(params[:id])
		send_file("/../../../../home/math/videos_2015/#{@movie.url}")
	end
	
	private
	def movie_params
		params.require(:movie).permit(:filmmaker_name, :production_name, :title, :genre, :duration, :language, :subtitle, :format, :synopsis, :licence, :sharing, :url)
	end
	def filter_params
		params.permit(:filmmaker_name, :production_name, :title, :genre, :duration, :language, :subtitle, :format, :synopsis, :licence, :sharing, :url)
	end	
end