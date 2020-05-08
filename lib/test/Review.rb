
class Review

  @@all = []

  attr_accessor :movie_rating, :movie_title, :movie_summary, :link_to_summary
  def initialize(movie_rating, movie_title, movie_summary) 
    @movie_title = movie_title
    @movie_rating = movie_rating
    @movie_summary = movie_summary
    @@all << self
  end

  def self.all
    @@all
  end

  def self.print_all_reviews
    self.all.each_with_index do |review, index|
      puts "== Review ##{index + 1} ==="
      puts "movie rating:" + review.movie_rating
      puts "movie title:" + review.movie_title
      puts review.movie_summary
      puts "=================="
    end
  end

end
