class IMDBReviewScraper

  #first level scraping
  def self.scrape_and_make_reviews
    url = "https://www.imdb.com/?ref_=nv_home"
    html_to_elements = open(url)
    parsed_html_elements = Nokogiri::HTML(html_to_elements)
    review_elements = parsed_html_elements.css('.review')
    review_elements.map do |element|
      binding.pry
      movie_rating = element.css('.ipc-rating-star--baseAlt').text
      rating = Rating.find_or_create_by(movie_rating)
      movie_title = element.css('.ipc-poster-card__title ipc-poster-card__title--clamp-2 ipc-poster-card__title-href').text
      title = Title.find_or_create_by(movie_title)
      url = element.css('a.ipc-focusable').attr('href').value
      new_review = Review.new(rating, title)
    end
  end

  #second level scraping 
  def self.scrape_review_blurb(url)
    html_to_elements = open(url)
    parsed_html_elements = Nokogiri::HTML(html_to_elements)   
    review_elements = parsed_html_elements.css('.review')
    review_elements.map do |element|
        binding.pry
      movie_summary = element.css('.summary_text').text
      summary = Summary.find_or_create_by(movie_summary)
  end
end

