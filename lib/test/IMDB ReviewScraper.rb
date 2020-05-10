class IMDBReviewScraper

  #first level scraping
  def self.scrape_and_make_reviews
    homepage = Nokogiri::HTML(open("https://www.imdb.com/?ref_=nv_home"))
    #binding.pry
    homepage.css("ipc-rating-star.ipc-rating-star--baseAlt.ipc-rating-star--imdb").each do |element|
      movie_rating = element.css("ipc-poster-card__top")[0].text
      movie_title = element.css("ipc-poster-card__title-href")[0].text
      link_to_summary = "https://www.imdb.com" + element.css('a.ipc-focusable').attribute("href").value
      new_review = Review.new(movie_rating, movie_title, link_to_summary)
      
      #binding.pry
      scrape_review_blurb(new_review)
    end
    
  end

  #second level scraping 
  def self.scrape_review_blurb(new_review)  
    movie_information = Nokogiri::HTML(open(new_review.link_to_summary))
        movie_information.css(".plot_summary").each do |movie_info|
          new_review.movie_summary = movie_info.css('.summary_text').text
          
        end
  end

end

