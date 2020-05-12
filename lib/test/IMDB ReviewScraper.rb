require 'pry'
class IMDBReviewScraper

  #first level scraping
  def self.scrape_and_make_reviews
    homepage = Nokogiri::HTML.parse(open("https://www.imdb.com/chart/top/?ref_=nv_mv_250")) 
    #binding.pry

    homepage.css('.lister-list').css('tr').each do |element|  
      
      #binding.pry
      movie_rating = element.css(".ratingColumn.imdbRating").text #ipc-rating-star ipc-rating-star--baseAlt ipc-rating-star--imdb
      movie_title = element.css('.titleColumn').text  #ipc-poster-card__title ipc-poster-card__title--clamp-2 ipc-poster-card__title-href
      link_to_summary = "https://www.imdb.com" + element.css('a').attribute("href").value
      new_review = Review.new(movie_rating, movie_title, link_to_summary)
      #binding.pry
      scrape_review_blurb(new_review)

    end
    
  end

  #second level scraping 
  def self.scrape_review_blurb(new_review)  
    movie_information = Nokogiri::HTML.parse(open(new_review.link_to_summary))
        movie_information.css(".plot_summary").each do |movie_info|
          new_review.movie_summary = movie_info.css('.summary_text').text
          
        end
  end
end


