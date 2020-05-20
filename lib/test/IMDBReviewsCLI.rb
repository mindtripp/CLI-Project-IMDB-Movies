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
        # validation = false
        # while validation == false do
        #     Display.prompt_to_pick_review
        #     input = gets.strip
        #         if 0 < input.to_i and input.to_i <= Review.all.size
        #             validation == true
        #             review = Review.all[input.to_i-1]
        #             puts "Here is your selected movie's summary:"
        #             puts review.movie_title.split("\n")[2]
        #             puts review.movie_summary
        #             puts ""
        #             puts "Do you want to see another movie review?"
        #             puts "Thanks for visiting IMDB Reviews!"
        #             break
        #         elsif input.to_i > Review.all.size
        #             validation == false
        #             puts "Please choose a number from 1-10."
        #         elsif input.to_i == 0 
        #             validation == false
        #             puts "Invalid input, please try again (Enter a number)."
        #         end
        # end
        
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


