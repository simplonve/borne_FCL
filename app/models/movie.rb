require 'elasticsearch/model'

class Movie < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
Movie.create!
Movie.import # for auto sync model with elastic search