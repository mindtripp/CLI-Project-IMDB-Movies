require 'pry'
class IMDBReviewScraper

  #first level scraping
  def self.scrape_and_make_reviews
    homepage = Nokogiri::HTML.parse(open("https://www.imdb.com/?ref_=nv_home").read)
    #binding.pry
    homepage.css(".ipc-sub-grid-item.ipc-sub-grid-item--span-2").each do |element| #ipc-rating-star.ipc-rating-star--baseAlt.ipc-rating-star--imdb
      #binding.pry
      movie_rating = element.css("span.ipc-rating-star").text.to_i #ipc-rating-star ipc-rating-star--baseAlt ipc-rating-star--imdb
      #Review.movie_rating = movie_rating
      movie_title = element.css('a.ipc-poster-card__title').text  #ipc-poster-card__title ipc-poster-card__title--clamp-2 ipc-poster-card__title-href
      #Review.movie_title = movie_title
      link_to_summary = "https://www.imdb.com" + element.css('a.ipc-focusable').attribute("href").value
      #Review.link_to_summary = link_to_summary
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

