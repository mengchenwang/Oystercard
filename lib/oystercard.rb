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
    money.top_up_check(num)
    money.pay_in(num)
  end

  def touch_in(station = "no record")
    money.touch_in_check
    touch_out if @journey.did_not_touch_out?
    @journey.entry(station)
  end

  def touch_out(station = "no record")
    touch_in if @journey.did_not_touch_in?
    @journey.leave(station)
    @journey.complete? ? money.fare(@journey.journey)
                         : money.penalty
    @journeylog.store_journey(@journey.journey)
  end
end
