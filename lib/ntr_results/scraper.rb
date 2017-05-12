class NtrResults::Scraper
  attr_accessor :name, :date, :location, :winner, :url

  def self.all
    # scrape nationalteamroping.com
    self.scrape_events
  end

  def self.scrape_events
    events = []

    events << self.scrape_ntr
    # events << self.scrape_ntr2
    # events << self.scrape_ntr3

    events
  end

  def self.scrape_ntr
      doc = Nokogiri::HTML(open("http://nationalteamroping.com/articles.sec-26-1-results.html"))
      event = self.new
      event.name = doc.search(".title-txt h1").collect{ |e| "#{e}"}  #{|e| e.text.gsub}

      event
  end


  def self.scrape_ntr1
    doc = Nokogiri::HTML(open("http://nationalteamroping.com/article-812-rancho-rio-qualifier.html"))

    event = self.new
    event.name = doc.search("#article-812 p")[0].text
    event.date  = doc.search("#article-812 p")[1].text
    event.location = doc.search("#article-812 p")[2].text
    event.winner = doc.search("#article-812 p")[10].text  # => "1st in Ave - 33.62 on 4, Sam Scott & John Miller  $1350"

    event
  end

def self.scrape_ntr2
  doc = Nokogiri::HTML(open("http://nationalteamroping.com/article-815-tgif-4_7_17.html"))

  event = self.new
  event.name = doc.search("#article-815 p")[0].text
  event.date  = doc.search("#article-815 p")[1].text
  event.location = doc.search("#article-815 p")[2].text
  event.winner = doc.search("#article-815 p")[7].text  # => "1st in Ave - 40.31 on 4, Bruce Northrop & Richard Mayfield  $1840"

  event
end

def self.scrape_ntr3
  doc = Nokogiri::HTML(open("http://nationalteamroping.com/article-816-%25245000-sat.html"))

  event = self.new
  event.name = doc.search("#article-816 p")[0].text
  event.date  = doc.search("#article-816 p")[1].text
  event.location = doc.search("#article-816 p")[2].text
  event.winner = doc.search("#article-816 p")[7].text  # =>  "1st in Ave - 38.35 on 4, Jerry Turk & Pat Danehey  $5000"

  event
end

end
