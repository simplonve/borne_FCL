class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
    	t.string :filmmaker_name
    	t.string :production_name
    	t.string :title
    	t.string :genre
    	t.string :duration
    	t.string :language
    	t.string :subtitle
    	t.string :format
    	t.text :synopsis
    	t.string :licence
    	t.boolean :sharing
    	t.string :url	
    t.timestamps null: false
    end
  end
end
