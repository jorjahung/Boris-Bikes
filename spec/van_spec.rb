require_relative "../lib/van"

describe Van do
	let(:van) { Van.new(:capacity => 10) }
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
	let(:garage) { Garage.new(:capacity => 100) }

	it "should allow setting default capacity on init" do
		expect(van.capacity).to eq(10)
	end

	it "should empty a stations broken bikes" do
		expect(test_station.bike_count).to eq(14)
	 	van.get_broken_bikes(test_station)
	 	expect(test_station.bike_count).to eq(10)
	 	expect(van.bike_count).to eq(4)
	end

	it "should give broken bikes to garage" do
		van.get_broken_bikes(test_station)
		van.give_bikes(garage)
		expect(garage.bike_count).to eq(4)
	end

	it "should empty a stations working bikes" do
		expect(test_station.bike_count).to eq(14)
	 	test_station.give_working_bikes.each{|bike| van.dock(bike)}
	 	expect(test_station.bike_count).to eq(4)
	 	expect(van.bike_count).to eq(10)
	end
end