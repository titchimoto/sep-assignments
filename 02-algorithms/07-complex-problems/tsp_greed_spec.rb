include RSpec

require_relative 'tsp_greed'

RSpec.describe TravelingSalesman, type: Class do
    let(:tsp) { TravelingSalesman.new }

    let(:portland) { City.new("Portland") }
    let(:new_york) { City.new("New York") } 
    let(:miami) { City.new("Miami") }
    let(:boston) { City.new("Boston") }
    let(:austin) { City.new("Austin") }

    before :each do
        portland.neighbors = [
            Neighbor.new(boston, 3088),
            Neighbor.new(new_york, 2902),
            Neighbor.new(austin, 2054),
            Neighbor.new(miami, 3255)
        ]
        new_york.neighbors = [
            Neighbor.new(boston, 215),
            Neighbor.new(miami, 1277),
            Neighbor.new(portland, 2902),
            Neighbor.new(austin, 1742)
        ]
        miami.neighbors = [
            Neighbor.new(boston, 1489),
            Neighbor.new(portland, 3255),
            Neighbor.new(austin, 1352),
            Neighbor.new(new_york, 1277)
        ]
        boston.neighbors = [
            Neighbor.new(portland, 3088),
            Neighbor.new(new_york, 215),
            Neighbor.new(miami, 1489),
            Neighbor.new(austin, 1963)
        ]
        austin.neighbors = [
            Neighbor.new(portland, 2054),
            Neighbor.new(miami, 1352),
            Neighbor.new(boston, 1963),
            Neighbor.new(new_york, 1742)
        ]
    end

    describe "#nearest_possible_neighbor" do
        it "returns the correct list of cities" do
            output = tsp.nearest_possible_neighbor(portland)
            expect(output).to eq "Portland -> Austin -> Miami -> New York -> Boston -> Portland"
        end

        it "returns the correct list of cities" do
            output = tsp.nearest_possible_neighbor(new_york)
            expect(output).to eq "New York -> Boston -> Miami -> Austin -> Portland -> New York"
        end

        it "returns the correct list of cities" do
            output = tsp.nearest_possible_neighbor(miami)
            expect(output).to eq "Miami -> New York -> Boston -> Austin -> Portland -> Miami"
        end

        it "returns the correct list of cities" do
            output = tsp.nearest_possible_neighbor(boston)
            expect(output).to eq "Boston -> New York -> Miami -> Austin -> Portland -> Boston"
        end

        it "returns the correct list of cities" do
            output = tsp.nearest_possible_neighbor(austin)
            expect(output).to eq "Austin -> Miami -> New York -> Boston -> Portland -> Austin"
        end
    end

end
