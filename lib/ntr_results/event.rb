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
    @@all.sort_by!{|event| event.name}
  end

  # def sort_by_index()
  #   @@all.event.split('').map{|event| event.to_i }
  # end
end
