include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do

  let (:heap) { MinBinaryHeap.new }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:matrix) { Node.new("The Matrix", 87) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new left child node first" do
        heap.insert(matrix)
        heap.insert(jedi)
        expect(heap.items[1].title).to eq "The Matrix"
    end

    it "properly inserts a new node and swaps with root if neccessary" do
        heap.insert(matrix)
        heap.insert(jedi)
        expect(heap.items[0].title).to eq "Star Wars: Return of the Jedi"
      end

    it "properly inserts the next node as a right child" do
        heap.insert(matrix)
        heap.insert(jedi)
        heap.insert(donnie)
        expect(heap.items[2].title).to eq "The Matrix"
    end


    it "properly inserts a new node as a left-left child" do
        heap.insert(matrix)
        heap.insert(jedi)
        heap.insert(donnie)
        heap.insert(district)
        heap.insert(braveheart)
      expect(heap.items[3].title).to eq "District 9"
    end

    it "properly inserts a new node as a left-right child" do
        heap.insert(matrix)
        heap.insert(jedi)
        heap.insert(donnie)
        heap.insert(district)
        heap.insert(martian)
      expect(heap.items[4].title).to eq "The Martian"
    end

    it "properly inserts a new node as a right-left child" do
        heap.insert(matrix)
        heap.insert(jedi)
        heap.insert(donnie)
        heap.insert(district)
        heap.insert(martian)
        heap.insert(hope)
      expect(heap.items[5].title).to eq "Star Wars: A New Hope"
    end

    it "properly inserts a new node as a right-right child" do
        heap.insert(matrix)
        heap.insert(jedi)
        heap.insert(donnie)
        heap.insert(district)
        heap.insert(martian)
        heap.insert(hope)
        heap.insert(mad_max_2)
        expect(heap.items[6].title).to eq "Mad Max 2: The Road Warrior"
      end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      heap.insert(empire)
      heap.insert(mad_max_2)
      expect(heap.find(nil)).to eq nil
    end

    it "properly finds a left node" do
      heap.insert(pacific_rim)
      heap.insert(matrix)
      expect(heap.find(matrix.title).title).to eq "The Matrix"
    end

    it "properly finds a left-left node" do
        heap.insert(matrix)
        heap.insert(jedi)
        heap.insert(donnie)
        heap.insert(district)
        heap.insert(braveheart)
      expect(heap.find(district.title).title).to eq "District 9"
    end

    it "properly finds a left-right node" do
        heap.insert(matrix)
        heap.insert(jedi)
        heap.insert(donnie)
        heap.insert(district)
        heap.insert(martian)
      expect(heap.find(martian.title).title).to eq "The Martian"
    end

    it "properly finds a right node" do
      heap.insert(matrix)
      heap.insert(braveheart)
      heap.insert(pacific_rim)
      expect(heap.find(braveheart.title).title).to eq "Braveheart"
    end

    it "properly finds a right-left node" do
        heap.insert(matrix)
        heap.insert(jedi)
        heap.insert(donnie)
        heap.insert(district)
        heap.insert(martian)
        heap.insert(hope)
        expect(heap.find(hope.title).title).to eq "Star Wars: A New Hope"
    end

    it "properly finds a right-right node" do
        heap.insert(matrix)
        heap.insert(jedi)
        heap.insert(donnie)
        heap.insert(district)
        heap.insert(martian)
        heap.insert(hope)
        heap.insert(mad_max_2)
        expect(heap.find(mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(heap.delete(nil)).to eq nil
    end

    it "properly deletes a left node" do
      heap.insert(matrix)
      heap.insert(jedi)
      heap.delete(jedi.title)
      expect(heap.find(jedi.title)).to be_nil
      expect(heap.items.size).to eq 1
    end

    it "properly deletes a left-left node" do
      heap.insert(matrix)
      heap.insert(jedi)
      heap.insert(donnie)
      heap.insert(district)
      heap.insert(braveheart)
      heap.delete(braveheart.title)
      expect(heap.find(braveheart.title)).to be_nil
      expect(heap.items.size).to eq 4
    end

    it "properly deletes a left-right node" do
      heap.insert(matrix)
      heap.insert(jedi)
      heap.insert(donnie)
      heap.insert(district)
      heap.insert(martian)
      heap.delete(martian.title)
      expect(heap.find(martian.title)).to be_nil
      expect(heap.items.size).to eq 4
    end

    it "properly deletes a right node" do
      heap.insert(matrix)
      heap.insert(jedi)
      heap.insert(donnie)
      heap.delete(donnie.title)
      expect(heap.find(donnie.title)).to be_nil
      expect(heap.items.size).to eq 2
    end

    it "properly deletes a right-left node" do
      heap.insert(matrix)
      heap.insert(jedi)
      heap.insert(donnie)
      heap.insert(district)
      heap.insert(martian)
      heap.insert(hope)
      heap.delete(hope.title)
      expect(heap.find(hope.title)).to be_nil
      expect(heap.items.size).to eq 5
    end

    it "properly deletes a right-right node" do
      heap.insert(matrix)
      heap.insert(jedi)
      heap.insert(donnie)
      heap.insert(district)
      heap.insert(martian)
      heap.insert(hope)
      heap.insert(mad_max_2)
      heap.delete(mad_max_2.title)
      expect(heap.find(mad_max_2.title)).to be_nil
      expect(heap.items.size).to eq 6
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nInception: 86\nStar Wars: Return of the Jedi: 80\nDistrict 9: 90\nThe Martian: 92\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
       heap.insert(hope)
       heap.insert(empire)
       heap.insert(jedi)
       heap.insert(martian)
       heap.insert(pacific_rim)
       heap.insert(inception)
       heap.insert(braveheart)
       heap.insert(shawshank)
       heap.insert(district)
       heap.insert(mad_max_2)
       expect { heap.printf }.to output(expected_output).to_stdout
     }

     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nInception: 86\nStar Wars: Return of the Jedi: 80\nStar Wars: A New Hope: 93\nDistrict 9: 90\nThe Martian: 92\nThe Shawshank Redemption: 91\nMad Max 2: The Road Warrior: 98\nStar Wars: The Empire Strikes Back: 94\n"
       heap.insert(mad_max_2)
       heap.insert(district)
       heap.insert(shawshank)
       heap.insert(braveheart)
       heap.insert(inception)
       heap.insert(pacific_rim)
       heap.insert(martian)
       heap.insert(jedi)
       heap.insert(empire)
       heap.insert(hope)
       expect { heap.printf }.to output(expected_output).to_stdout
     }
  end



end