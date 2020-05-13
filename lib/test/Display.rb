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
        puts "Suprise! We actually have 250 movie in our inventory." 
        puts "Pick your lucky number to see the corresponding movie summary: (Enter a number from 1 - 250)"
    end


    # def self.validation_input(input)
    #     if input.to_i <= Review.all.size
    #         validation = true
    #         review = Review.all[input.to_i-1]
    #         puts "Here is your selected movie's summary:"
    #         puts review.movie_title.split("\n")[2]
    #         puts review.movie_summary
    #     elsif input.to_i > Review.all.size
    #         validation = false
    #         puts "Please choose a number from 1-250."
    #     else
    #         validation = false
    #         puts "Invalid input, please try again (Enter a number)."
    #     end
    # end

    # def self.print_selected_summary(movie_summary)
    #     puts "Here is your selected movie's summary: + #{selected_summary.movie_summary}"
    # end

end

