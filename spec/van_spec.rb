require_relative "../lib/van"

describe Van do
	let(:van) { Van.new(:capacity => 8) }
	let(:test_station) do
		st = DockingStation.new(:capacity =>20)
		10.times{ st.dock(Bike.new)}
		4.times do
			bike = Bike.new
			bike.break
			st.dock(bike)
		end
		st
	end

	it "should allow setting default capacity on init" do
		expect(van.capacity).to eq(8)
	end

	it "should empty a stations broken bikes" do
		expect(test_station.bike_count).to eq(14)
	 	van.get_broken_bikes(test_station)
	 	expect(test_station.bike_count).to eq(10)
	 	expect(van.bike_count).to eq(4)
	end
end