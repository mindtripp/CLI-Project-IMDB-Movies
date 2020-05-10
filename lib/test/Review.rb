
class Review
  attr_accessor :movie_rating, :movie_title, :movie_summary, :link_to_summary 

  @@all = []

  def initialize(movie_rating, movie_title, link_to_summary) 
    @movie_rating = movie_rating
    @movie_title = movie_title
    @link_to_summary = link_to_summary
    @@all << self
  end

  def self.all
    @@all
  end

end
