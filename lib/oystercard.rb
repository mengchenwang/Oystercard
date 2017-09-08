require_relative 'money'
require_relative 'journey'
require_relative 'journeylog'

class Oystercard

  def initialize
    @money = Money.new
    @journey = Journey.new
    @journeylog = JourneyLog.new
  end

  def top_up(num)
    @money.top_up(num)
  end

  def touch_in(station)
    @money.touch_in_check
    touch_out("no record") if @journey.in_journey?
    @journey.entry(station)
  end

  def touch_out(station)
    touch_in("no record") unless @journey.in_journey?
    old_balance = balance
    @journey.leave(station)
    @journey.complete? ? @money.fare(@journey.journey)
                       : @money.penalty
    fare = {:fare => (old_balance - balance)}
    @journeylog.store_journey(@journey.journey, fare)
  end

  def balance
    @money.balance
  end

  def print_journeylog
    @journeylog.print_log
  end
end
