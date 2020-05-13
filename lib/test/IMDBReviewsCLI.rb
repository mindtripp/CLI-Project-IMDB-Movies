class IMDBReviewsCLI

    def run
        system("clear")
        Display.greet
        Display.get_name
        Display.start_scraping 
        Review.print_all_reviews

        validation = false
        while validation == false do
            Display.prompt_to_pick_review
            input = gets.strip
                if 0 < input.to_i and input.to_i <= Review.all.size
                    validation == true
                    review = Review.all[input.to_i-1]
                    puts "Here is your selected movie's summary:"
                    puts review.movie_title.split("\n")[2]
                    puts review.movie_summary
                    puts ""
                    puts "Thanks for visiting IMDB Reviews!"
                    break
                elsif input.to_i > Review.all.size
                    validation == false
                    puts "Please choose a number from 1-250."
                elsif input.to_i == 0
                    validation == false
                    puts "Invalid input, please try again (Enter a number)."
                end
        end
        # validation = false
        # until validation
        #     Display.prompt_to_pick_review
        #     input = gets.strip

        #         if input.to_i <= Review.all.size
        #             review = Review.all[input.to_i-1]
        #             puts "Here is your selected movie's summary:"
        #             puts review.movie_title.split("\n")[2]
        #             puts review.movie_summary
        #             validation = true
        #         end
                
        # end
    end

end

