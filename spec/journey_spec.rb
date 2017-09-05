require 'journey'

describe Journey do
  subject { described_class.new }
  let(:station) { double :station, station: :Old_Street, zone: 1}

  it "knows if a journey is not complete" do

    expect(subject).not_to be_complete
  end

  it 'has a penalty fare by default' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it "returns itself when exiting a journey" do
    expect(subject.finish(station)).to eq(subject)
  end

  context 'given an entry station' do
    subject.entry(station)

    it 'has an entry station' do
      expect(subject.entry_station).to eq station
    end

    it "returns a penalty fare if no exit station given" do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    context 'given an exit station' do
      let(:other_station) { double :other_station }

      before do
        subject.entry(station)
        subject.leave(other_station)
      end

      it "knows if a journey is complete" do
        expect(subject).to be_complete
      end

      it "knows if a journey is not complete" do
        subject.leave(station)
        expect(subject).not_to be_complete
      end
    end
  end
end
