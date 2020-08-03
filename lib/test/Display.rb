class Display

    def self.greet
        puts "Hello there, welcome to the IMDB Movie Review!"
        puts ""
        puts ""
        puts "What is your name?"
    end
    
    def self.get_name
        name = gets.chomp
        puts ""
        puts "Welcome, #{name}"
    end
    
    def self.start_scraping
        puts "We're about to scrape..."
        puts "Please Wait a few moments..."
        IMDBReviewScraper.scrape_and_make_reviews
        puts "Movie list is ready!"
    end

    
    def self.prompt_to_pick_review
        puts "Suprise! We have the top 10 movies in our inventory." 
        puts "Pick your lucky number to see the corresponding movie summary: (Enter a number from 1 - 10)"
    end

end

