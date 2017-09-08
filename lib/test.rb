require_relative 'oystercard'
require_relative 'station'

oyster = Oystercard.new
waterloo = Station.new(:waterloo, 1)
victoria = Station.new(:victoria, 1)
canada_water = Station.new(:canada_water, 2)
arsenal = Station.new(:arsenal, 2)
wood_green = Station.new(:wood_green, 3)
wimbledon = Station.new(:wimbledon, 3)
wembley_park = Station.new(:wembley_park, 4)
richmond = Station.new(:richmond, 4)
northolt = Station.new(:northolt, 5)
rayners_lane = Station.new(:rayners_lane, 5)
heathrow = Station.new(:heathrow, 6)
uxbridge = Station.new(:uxbridge, 6)

oyster.top_up(80)
p "starting balance:"
p "expect 80 => #{oyster.balance}"
oyster.touch_out(waterloo)
p "edge case: touch out only on 1st use, penalty: £6"
p "expect 74 => #{oyster.balance}"

oyster.touch_in(waterloo)
oyster.touch_in(waterloo)
p "edge case: 2 touch-ins, penalty: £6"
p "expect 68 => #{oyster.balance}"

oyster.touch_out(victoria)
p "normal journey: zone1 - zone1, fare: £1"
p "expect 67 => #{oyster.balance}"

oyster.touch_in(waterloo)
oyster.touch_out(canada_water)
p "normal journey: zone1 - zone2, fare: £2"
p "expect 65 => #{oyster.balance}"

oyster.touch_in(waterloo)
oyster.touch_out(wimbledon)
p "normal journey: zone1 - zone3, fare: £3"
p "expect 62 => #{oyster.balance}"

oyster.touch_in(waterloo)
oyster.touch_out(richmond)
p "normal journey: zone1 - zone4, fare: £4"
p "expect 58 => #{oyster.balance}"

oyster.touch_in(waterloo)
oyster.touch_out(northolt)
p "normal journey: zone1 - zone5, fare: £5"
p "expect 53 => #{oyster.balance}"

oyster.touch_in(waterloo)
oyster.touch_out(heathrow)
p "normal journey: zone1 - zone6, fare: £6"
p "expect 47 => #{oyster.balance}"

oyster.touch_in(uxbridge)
oyster.touch_out(canada_water)
p "normal journey: zone6 - zone2, fare: £5"
p "expect 42 => #{oyster.balance}"

oyster.print_journeylog
