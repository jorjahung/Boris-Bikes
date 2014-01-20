require './lib/bike_container'

class ContainerHolder
	include BikeContainer
end

describe BikeContainer do
	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }

	it "should accept a bike" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end


	it "should not release a bike that's not there" do
		expect(lambda {holder.release(bike)}).to raise_error(RuntimeError)
	end

	it "should not release a bike that's not there" do
		expect(lambda {holder.release("orange")}).to raise_error(RuntimeError)
	end

	it "should raise an error if we are docking a gorilla" do
		expect(lambda {holder.dock("gorilla")}).to raise_error(RuntimeError)
	end

end