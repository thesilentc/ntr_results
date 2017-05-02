
class NtrResults::CLI #controller cli

  def call
    list_results
    menu
    # turbo_encabulator

  end

  def list_results
    puts "----------National Team Roping Results:----------"
    puts " "
    @events = NtrResults::Event.today
    @events.each.with_index(1) do |event, i|
      puts "#{i}. #{event.name} - #{event.date} - #{event.location}"
    end
  end

  def menu
    input = nil
    while input != 'exit'
      puts ""
      puts "Enter the number of the event you'd like more information about"
      puts "or type 'list' to view the events again"
      puts "or type 'exit' to exit"
      input = gets.strip.downcase

      if input.to_i > 0
        main_event = @events[input.to_i-1]
        puts "#{main_event.name} - #{main_event.date} - #{main_event.location}"
      elsif input == "list"
        list_results
      elsif input == "exit"
        turbo_encabulator
      else
        puts " "
        puts "I'm sorry. I don't understand what you want."
        puts " "
      end
    end
  end

  def turbo_encabulator
    puts "Check back next week for more NTR results"
  end

end
