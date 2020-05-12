class IMDBReviewsCLI
     def run
        system("clear")
        Display.greet
        Display.get_name
        Display.start_scraping 
        Review.print_all_reviews  
        Display.prompt_to_pick_review
        input = gets.strip
        input.to_i <= Review.all.size
        review = Review.all[input.to_i-1]
        puts review.movie_summary

    end
    
    
    #  def print_all_reviews
    #    reviews = Review.all
    #   reviews.each.with_index(1) do |review, index|
    #         puts "== Review ##{index + 1} ==="
    #         puts "movie rating:" + review.movie_rating
    #         puts "movie title:" + review.movie_title
    #         puts review.movie_summary
    #         puts "=================="
    #     end          
    # end
end
