require_relative 'station'

class Money
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  PENALTY = 6

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(num)
    fail "Exceeded maximum balance of $#{MAXIMUM_BALANCE}" if over_limit?(num)
    deduct(-num)
  end

  def touch_in_check
    fail "Balance is below the minimum of $#{MINIMUM_BALANCE}" if not_enough?
  end

  def penalty
    deduct(PENALTY)
  end

  def fare(journey)
    @fare = calculator(journey)
    deduct(@fare)
  end

  private

  def calculator(journey)
    entry_station = journey[:entry_station]
    exit_station = journey[:exit_station]
    1 + (exit_station.zone - entry_station.zone).abs
  end

  def deduct(num)
    @balance -= num
  end

  def not_enough?
    @balance < MINIMUM_BALANCE
  end

  def over_limit?(num)
    @balance + num  > MAXIMUM_BALANCE
  end
end
