class NtrResults::Event
  attr_accessor :name, :date, :location, :winner, :url
  @@all = []


  def initialize()
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(index)
    @@all[index]
  end

  def self.sort_by_name()
    #this method will return the events in alphabetical order of name

    @@all.sort_by!{|event| event.name}

  end
    # @@all.sort_by { |event| event.downcase }
    # @@all.sort_by {|event| event.upcase}
    # @@all.sort
  # end

end
