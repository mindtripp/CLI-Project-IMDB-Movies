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

class IMDBReviewsCLI

    def run
        system("clear")
        Display.greet
        Display.get_name
        Display.start_scraping 
        Review.print_all_reviews
        print_review = true
        while print_review 
            get_and_check_user_input
            print_review = user_choice
        end
        
        
    end
    

    def get_and_check_user_input
            Display.prompt_to_pick_review
            input = gets.strip
                if 0 < input.to_i and input.to_i <= Review.all.size
                    review = Review.all[input.to_i-1]
                    puts "Here is your selected movie's summary:"
                    puts review.movie_title.split("\n")[2]
                    puts review.movie_summary
                    puts ""
                elsif input.to_i > Review.all.size
                    puts "Please choose a number from 1-10."
                    get_and_check_user_input
                elsif input.to_i == 0 
                    puts "Invalid input, please try again (Enter a number)."
                    get_and_check_user_input
                end
    end            
        

    def user_choice
        puts "Would you like to see another movie review? (yes/no)"
        input = gets.chomp.downcase
        if input == "yes"
            return true
        elsif input == "no"
            puts "Thank you for visiting IMBD Movie Review."
            return false
        else input != "yes" || "no"
            puts "Inalid input, please try again!"
            user_choice
        end
    end

end


