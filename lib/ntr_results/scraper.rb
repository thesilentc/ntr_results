class NtrResults::Event
  attr_accessor :name, :date, :location, :winner, :url
  @@all = []

    def initialize(row, name=nil, date=nil, url=nil, location=nil, winner=nil)
      @name = name
      @date = date
      @url = url
      @location = location
      @winner = winner

      @@all << self unless @@all.include?(self.name)
    end

    def self.all    #NtrResults::Event.all for cli.rb 14  ???
      @@all
    end



end

# scrape all events from a single pahge
# def scrape_events
# doc = Nokogiri::HTML(open("http://nationalteamroping.com/articles.sec-26-1-results.html"))
# events = doc.css(".title-txt h1").text
# events.split('').map{|event| event.to_i }


def scrape_events
doc = Nokogiri::HTML(open("http://nationalteamroping.com/articles.sec-26-1-results.html"))
binding.pry
events = doc.css(".title-txt h1").text
events.split('').map{|event| event.to_i }
end
