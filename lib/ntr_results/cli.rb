
class NtrResults::CLI #controller cli


  def call
    NtrResults::Scraper.scrape_events
    list_events
    menu
  end

  def list_events
    puts "----------National Team Roping Results:----------"
    puts " "
    NtrResults::Event.sort_by_name
    # NtrResults::Event.sort_by_index
    NtrResults::Event.all.each.with_index(1) do |event, i|

      puts "#{i}. #{event.name} - #{event.date} - #{event.location}"
    end
  end

  def menu
    input = nil
    while input != 'exit'
      puts " "
      puts "Enter the event you'd like to know the winners of"
      puts "or type 'list' to view the events again or type 'exit' to exit"
      input = gets.strip.downcase

      if input.to_i.between?(1, NtrResults::Event.all.size)
        main_event = NtrResults::Event.find(input.to_i-1)
        puts "#{main_event.name} - #{main_event.winner}"
      elsif input == "list"
        list_events
      elsif input == "exit"
        turbo_encabulator
      elsif input.to_i >= 3
        sleep 0.33
        puts "I'm sorry. Note: there are only 3 events."
        sleep 1.0
      else
        puts " "
        puts "I'm sorry. I don't understand what you want."
        puts " "
      end
    end
  end

  def turbo_encabulator
    puts " "
    puts "Check back next week for more NTR results"
    puts " "
  end

end
