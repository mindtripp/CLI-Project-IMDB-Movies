
class Review
  attr_accessor :movie_rating, :movie_title, :movie_summary, :link_to_summary 

  @@all = []

  def initialize(movie_rating, movie_title, link_to_summary) 
    @movie_rating = movie_rating
    @movie_title = movie_title
    @link_to_summary = link_to_summary
    @@all << self
    #puts "Making #{movie_rating}"
  end

  def self.all
    @@all
  end

  def self.print_all_reviews
    Review.all.each_with_index do |review, index|
          puts "== Review ##{index + 1} ===" 
          puts "movie rating:" + review.movie_rating.split("\n")[1]
          puts "movie title:" + review.movie_title.split("\n")[2]
          puts review.movie_summary
          puts "==================" 
    end          
  end

end
