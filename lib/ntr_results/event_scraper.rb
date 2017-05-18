# this class is in beta. This will scrape a web page
#that lists all of the events and puts an array of those events

#

class NtrResults::EventScraper

  def event
    Nokogiri::HTML(open("http://nationalteamroping.com/articles.sec-26-1-results.html"))
  end

  def scrape_ntr
      # doc = Nokogiri::HTML(open("http://nationalteamroping.com/articles.sec-26-1-results.html"))
      event = self.new
      event.name = doc.css(".title-txt h1 a").collect{|e| e.text}
      # event.name = doc.css(".title-txt h1 a").collect{ |e| "#{e}"}
      # event.name = doc.css(".title-txt h1 a").collect.to_s{ |e| "#{e}"}
      event
  end

end
