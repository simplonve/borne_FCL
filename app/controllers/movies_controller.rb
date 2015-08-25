class MoviesController < ApplicationController
	include MoviesHelper
	def index
		@movies = Movie.all
		@tags = Movie.tags
	end
	def search_title
		@movie = Movie.find(params[:id])
		redirect_to action: 'show', id: @movie.id
	end
	def search_tag
		@tags = Movie.tags
		@movies = Movie.search_tags(params[:tag])
		@other_movies = Movie.all if @movies.empty?
		render 'results'
	end
	def show
		@movie = Movie.find(params[:id])
		@tags = @movie.tags
		# @movie_size = File.size(ENV['HOME']+"/videos_2015/"+@movie.url).to_mega_octet
	end
	def watch
		@movie = Movie.find(params[:id])
		line = Cocaine::CommandLine.new("vlc --fullscreen $HOME'/videos_2015/#{@movie.url}'")
		line.run
		render 'show'
	end
	def download
		@movie = Movie.find(params[:id])
		binding.pry
		@file = open(ENV['HOME']+"/videos_2015/#{@movie.url}")
		binding.pry
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
