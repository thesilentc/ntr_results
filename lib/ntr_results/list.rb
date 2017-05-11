# cli controller option
def list_events

    rows = []

    @events ||= NtrResults::Event.new
    @events.each.with_index(1) do |team, i|
      rows << [i, event.name]
    end


end


# from Dalma
def list_events
    s = HouseFloorBills::Scraper.new
    @schedule = s.scrape

    puts "\n-------------------------------------------"
    puts "#{@schedule.title}"
    puts "-------------------------------------------\n "

    @schedule.bills.each.with_index(1) do |bill, i|
      puts "#{i}. #{bill.number} - #{bill.name}"
    end
  end

# from melind fro cli controller
class  NtrResults::CLI

def call
  puts "Welcome to NTR Results"
  list_stories
  menu
end

def list_events
  events = NtrResults::Event.scrape_events
  events.each_with_index do |event, i|
    puts "#{i+1} #{event}"
end
end
end
# event scraper from melind
def self.scrape_events
    @doc = Nokogiri::HTML(open('http://techcrunch.com/'))

    titles = [] # always the same
    @doc.search("ul#river1 h2.post-title").each do |h2|
      titles << h2.text # different
    end
    titles # always the same
  end
