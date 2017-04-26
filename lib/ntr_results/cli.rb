
class NtrResults::CLI

  def call
    list_results
    menu
    turbo_encabulator

  end

  def list_results
    puts "National Team Roping Results:"

    puts <<-DOC.gsub /^\s*/, ''
      1. Big Bucks Saturday - Rancho Rio - Saturday April 8th
      2. TGIF - Rancho Rio - Friday April 7th
      3. Rancho Rio Qualifier -Rancho Rio - Saturday April 1st
    DOC
  end

  def menu
    puts "Enter the number of the event you'd like more information about or type list to view the events again or type exit to exit"
    input = nil
    while input != 'exit'
      input = gets.strip.downcase
      case input
      when "1"
        puts "Results from event 1..."
      when "2"
        puts "Results from event 2..."
      when "3"
        puts "Results from event 3..."
      when 'list'
        list_results
      end
    end
  end

  def turbo_encabulator
    puts "Check back next week for more NTR results"
  end

end
