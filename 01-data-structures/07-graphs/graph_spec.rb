include RSpec

require_relative 'graph'

RSpec.describe Graph, type: Class do
    let(:graph) { Graph.new }

    let(:kevin_bacon) { Node.new("Kevin Bacon") }
    let(:jon_lithgow) { Node.new("John Lithgow") }
    let(:matthew_mcconaughey) { Node.new("Matthew McConaughey") }
    let(:jennifer_garner) { Node.new("Jennifer Garner") }
    let(:ben_affleck) { Node.new("Ben Affleck") }
    let(:bruce_willis) { Node.new("Bruce Willis") }
    let(:alan_rickman) { Node.new("Alan Rickman") }
    let(:michael_gambon) { Node.new("Michael Gambon") }
    let(:colin_firth) { Node.new("Colin Firth") }

    before(:each) do
        colin_firth.film_actor_hash["The King's Speech"] = [michael_gambon]
        michael_gambon.film_actor_hash["Harry Potter"] = [alan_rickman]
        alan_rickman.film_actor_hash["Die Hard"] = [bruce_willis]
        bruce_willis.film_actor_hash["Armageddon"] = [ben_affleck]
        ben_affleck.film_actor_hash["Daredevil"] = [jennifer_garner]
        jennifer_garner.film_actor_hash["Dallas Buyers Club"] = [matthew_mcconaughey]
        matthew_mcconaughey.film_actor_hash["Interstellar"] = [jon_lithgow]
        jon_lithgow.film_actor_hash["Footloose"] = [kevin_bacon]
    end

    describe "#find_kevin_bacon" do
        it "if @films is larger than 6, it returns an error" do
          output = graph.find_kevin_bacon(colin_firth)
          expect(output).to eq "Colin Firth is not connected to Kevin within 6 degrees or less."
        end

        it "handles nil gracefully" do
            output = graph.find_kevin_bacon(nil)
            expect(output).to eq "Invalid input. Please try again"
        end
    
        it "if actor is linked to Kevin in <= 6, list array of movies linking two actors" do
          output = graph.find_kevin_bacon(bruce_willis)
          expect(output).to eq ["Armageddon", "Daredevil", "Dallas Buyers Club", "Interstellar", "Footloose"]
        end

        it "if actor is linked ot Kevin in exactly 6 degrees, it correctly returns @films array" do
            output = graph.find_kevin_bacon(alan_rickman)
            expect(output).to eq ["Die Hard", "Armageddon", "Daredevil", "Dallas Buyers Club", "Interstellar", "Footloose"]
        end

        it "correctly shows error message if attempting to start on Kevin Bacon node" do
            output = graph.find_kevin_bacon(kevin_bacon)
            expect(output).to eq "Kevin Bacon IS Kevin Bacon."
        end
      end
    end