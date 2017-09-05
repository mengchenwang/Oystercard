class Station
  def initialize(station)
    @station = station
  end

  def name
    @station[:station]
  end

  def zone
    @station[:zone]
  end
end
