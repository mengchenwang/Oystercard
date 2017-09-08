require_relative 'station'

class JourneyLog

  attr_reader :journeylog

  def initialize
    @journeylog = []
  end

  def store_journey(journey, fare)
    entry_station = journey[:entry_station]
    exit_station = journey[:exit_station]
    log_fare = fare[:fare]
    log = format_log(entry_station, exit_station, log_fare)
    @journeylog << log
  end

  def format_log(entry_station, exit_station, log_fare)
    if entry_station == "no record"
      en_st_name = entry_station
    else
      en_st_name = entry_station.name.to_s
    end

    if exit_station == "no record"
      ex_st_name = exit_station
    else
      ex_st_name = exit_station.name.to_s
    end
    "#{en_st_name} => #{ex_st_name}, Fare: £#{log_fare}"
  end

  def print_log
    @journeylog.each.with_index(1) do |journey, index|
     p "#{index}. #{journey}"
    end
  end
end
