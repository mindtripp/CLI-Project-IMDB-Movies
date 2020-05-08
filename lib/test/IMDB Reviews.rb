lass IMDBReviewsCLI

  attr_accessor :username

  def greet
    puts "Hello There Welcome to the IMDB Review!"
    puts ""
    puts ""
    puts "What is your name?"
  end

  def get_name
    name = gets.chomp
    self.username = name
    puts "Welcome, #{self.username}"
    system("clear")
  end

  def start_scraping
    puts "We're about to scrape..."
    puts "Please Wait a few moments..."
    IMDBReviewScraper.scrape_and_make_reviews
    puts "Movie reviews are ready!"
  end

  def prompt_to_pick_review
    puts "Which movie's summary you want to read? (Enter the number)"

  end 

  def run
    system("clear")
    get_name
    start_scraping
    prompt_to_pick_review 
    Review.print_all_reviews
  end

end
