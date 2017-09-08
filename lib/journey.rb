class Journey

  attr_reader :journey

  def entry(station)
    @entry_station = station
  end

  def leave(station)
    @journey = { :entry_station => @entry_station,
                 :exit_station => station }
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  def complete?
    @journey[:entry_station] != "no record" &&
    @journey[:exit_station] != "no record"
  end
end
