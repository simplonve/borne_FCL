class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end
	def search
		@movies = Movie.where(filter_params.compact)
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
		redirect_to 'show'
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