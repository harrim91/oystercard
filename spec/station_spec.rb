require 'station'

describe Station do
  let (:zone) {double :zone}
  let (:name) {double :name}
describe '#initialize' do
  subject (:station) {Station.new(name, zone)}
  it 'has a zone' do
    expect(station.zone).to eq(zone)
  end
  it 'has a name' do
    expect(station.name).to eq(name)
  end
end


end