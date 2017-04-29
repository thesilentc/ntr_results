class NtrResults::Event
  attr_accessor :name, :date, :location, :winner, :url

  def self.today
    # scrape nationalteamroping.com
    self.scrape_events
  end

  def self.scrape_events
    events = []

    events << self.scrape_ntr

    # crape nationalteamroping.com, find the events
    # extract the properties/attributes
    # instantiate an event



    # event_1 = self.new
    # event_1.name = "'$5,000 Saturday'"
    # event_1.location = "Rancho Rio, Wickenburg, Arizona"
    # event_1.date = "April 8th, 2017"
    # event_1.winner = "1st in Ave - 38.35 on 4, Jerry Turk & Pat Danehey  $5000"
    # event_1.url = "http://nationalteamroping.com/article-816-%25245000-sat.html"
    #
    # event_2 = self.new
    # event_2.name = "'TGIF'"
    # event_2.location = "Rancho Rio, Wickenburg, Arizona"
    # event_2.date = "April 7th, 2017"
    # event_2.winner = "1st in Ave - 40.31 on 4, Bruce Northrop & Richard Mayfield  $1840"
    # event_2.url = "http://nationalteamroping.com/article-815-tgif-4_7_17.html"
    #
    events
  end

def self.scrape_ntr
  doc = Nokogiri::HTML(open("http://nationalteamroping.com/article-816-%25245000-sat.html"))
  binding.pry

end
end
