class Display

    def self.greet
        puts "Hello There Welcome to the IMDB Review!"
        puts ""
        puts ""
        puts "What is your name?"
    end
    
    def self.get_name
        name = gets.chomp
        puts "Welcome, #{name}"
    end
    
    def self.start_scraping
        puts "We're about to scrape..."
        puts "Please Wait a few moments..."
        IMDBReviewScraper.scrape_and_make_reviews
        puts "Movie reviews are ready!"
    end

    
    def self.prompt_to_pick_review
        puts "Which movie's summary you want to read? (Enter the number)"
    end


    def self.invalid_input
        puts "Invalid input, please try again (enter a number)."
    end

    def self.print_selected_summary(movie_summary)
        puts "Here is your selected movie's summary: + #{selected_summary.movie_summary}"
    end

end

