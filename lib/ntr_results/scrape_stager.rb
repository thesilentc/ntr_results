


def self.scrape_ntr
    doc = Nokogiri::HTML(open("http://nationalteamroping.com/articles.sec-26-1-results.html"))
    event = NtrResults::Event.new
    event.name = doc.css(".title-txt h1 a").collect{|e| e.text}

    # event
end
