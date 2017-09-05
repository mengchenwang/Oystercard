require 'station'

describe Station do
  subject(:station) { described_class.new( :station: "Old Street", :zone: 1) }

  it 'has a name' do
    expect(subject.station).to eq "Old Street"
  end

  it 'has a zone' do
    expect(subject.zone).to eq 1
  end
end
