
class NtrResults::CLI #controller cli

  def call
    list_events
    menu
    # turbo_encabulator


  end

  # def list_teams
  #
  #     rows = []
  #
  #     @teams ||= EplCliGem::Team.sorted
  #     @teams.each.with_index(1) do |team, i|
  #       rows << [i, team.name, team.games_played, team.goal_diff, team.points]
  #     end


  def list_events

    rows = []
    puts "----------National Team Roping Results:----------"
    puts " "
    @events ||= NtrResults::Event.today
    @events.each.with_index(1) do |event, i|
      rows << [i, event.name]
      #puts "#{i}. #{event.name}"# - #{event.date} - #{event.location}"
    end
    puts list_events
  end

  def menu
    input = nil
    while input != 'exit'
      puts
      puts "Enter the number of the event you'd like more information about"
      puts "or type 'list' to view the events again"
      puts "or type 'exit' to exit"
      input = gets.strip.downcase

      if input.to_i > 0
        main_event = @events[input.to_i-1]
        puts "#{main_event.winner}" # getting undefined method error #winner
      elsif input == "list"
        list_results
      elsif input == "exit"
        turbo_encabulator
      elsif input.empty?
        puts "I'm sorry. I don't understand what you want."
      else
        puts " "
        puts "I'm sorry. I don't understand what you want."
        puts " "
      end
    end
    main_event
  end

  def turbo_encabulator
    puts "Check back next week for more NTR results"
  end

end
