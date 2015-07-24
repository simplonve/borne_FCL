class MoviesController < ApplicationController
	def index
		if params[:q].nil?
		@movies = Movie.all
		else
		@movies = Movie.search params[:q]
		end
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
		params.require(:movie).permit(:filmmaker_name, :production_name, :title, :genre, :duration, :country, :subtitle, :format, :synopsis, :licence, :sharing, :url)
	end
	def filter_params
		params.permit(:filmmaker_name, :production_name, :title, :genre, :duration, :country, :subtitle, :format, :synopsis, :licence, :sharing, :url)
	end	
end