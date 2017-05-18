class NtrResults::Scraper
  #attr_accessor :name, :date, :location, :winner, :url

  # def self.all
  #   # scrape nationalteamroping.com
  #   self.scrape_events
  # end

  def self.scrape_events
    #events = []

    self.scrape_ntr1
    self.scrape_ntr2
    self.scrape_ntr3
    # self.scrape_ntr

    
  end

  # remove comment below to scrape all events from one page and print to array

  # def self.scrape_ntr
  #     doc = Nokogiri::HTML(open("http://nationalteamroping.com/articles.sec-26-1-results.html"))
  #     event = self.new
  #     event.name = doc.css(".title-txt h1 a").collect{|e| e.text}
  #     
  #     event
  # end


  def self.scrape_ntr1
    doc = Nokogiri::HTML(open("http://nationalteamroping.com/article-812-rancho-rio-qualifier.html"))

    event = NtrResults::Event.new
    event.name = doc.search("#article-812 p")[0].text
    event.date  = doc.search("#article-812 p")[1].text
    event.location = doc.search("#article-812 p")[2].text
    event.winner = doc.search("#article-812 p")[10].text  # => "1st in Ave - 33.62 on 4, Sam Scott & John Miller  $1350"

  end

def self.scrape_ntr2
  doc = Nokogiri::HTML(open("http://nationalteamroping.com/article-815-tgif-4_7_17.html"))

  event = NtrResults::Event.new
  event.name = doc.search("#article-815 p")[0].text
  event.date  = doc.search("#article-815 p")[1].text
  event.location = doc.search("#article-815 p")[2].text
  event.winner = doc.search("#article-815 p")[7].text  # => "1st in Ave - 40.31 on 4, Bruce Northrop & Richard Mayfield  $1840"

  event
end

def self.scrape_ntr3
  doc = Nokogiri::HTML(open("http://nationalteamroping.com/article-816-%25245000-sat.html"))

  event = NtrResults::Event.new
  event.name = doc.search("#article-816 p")[0].text
  event.date  = doc.search("#article-816 p")[1].text
  event.location = doc.search("#article-816 p")[2].text
  event.winner = doc.search("#article-816 p")[7].text  # =>  "1st in Ave - 38.35 on 4, Jerry Turk & Pat Danehey  $5000"

  event
end

end
