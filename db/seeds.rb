require 'csv'
Movie.destroy_all
csv_text = File.read('./db/movies.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  movie = Movie.new
  movie.filmmaker_name = row.to_hash["filmmaker_name"]
  movie.production_name = row.to_hash["production_name"] 
  movie.title = row.to_hash["title"] 
  movie.genre = row.to_hash["genre"] 
  movie.duration = row.to_hash["duration"] 
  movie.country = row.to_hash["country"] 
  movie.subtitle = row.to_hash["subtitle"] 
  movie.format = row.to_hash["format"] 
  movie.synopsis = row.to_hash["synopsis"] 
  movie.licence = row.to_hash["licence"] 
  movie.sharing = row.to_hash["sharing"] 
  movie.url = row.to_hash["url"]
  movie.img_url =  row.to_hash["img_url"]  
  movie.tags =  row.to_hash["tags"]
  movie.save
end