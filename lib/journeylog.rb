class JourneyLog

  attr_reader :journeys

  def initialize
    @journeys = []
  end

  def store_journey(journey)
    @journeys << journey
  end
end
