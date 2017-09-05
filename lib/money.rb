require_relative 'station'

class Money
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  PENALTY = 6

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def pay_in(num)
    deduct(-num)
  end

  def touch_in_check
    fail "Balance is below the minimum of $#{MINIMUM_BALANCE}" if not_enough?

  def top_up_check(num)
    fail "Exceeded maximum balance of $#{MAXIMUM_BALANCE}" if over_limit?(num)
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
