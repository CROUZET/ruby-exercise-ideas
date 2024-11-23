require "rspec"
require_relative "replenish"

describe "replenish" do
  subject(:replenish_list) { replenish(catalog, inventory_notes) }

  let(:catalog) {
    {
      "The Great Gatsby" => 30,
      "The Lord of the Rings" => 20,
      "White Fang" => 10,
    }
  }

  context "with full book names" do
    let(:inventory_notes) {
      [
        "The Great Gatsby",
        "The Great Gatsby",
        "White Fang",
      ]
    }

    it "returns the correct list" do
      expect(replenish_list).to eq(
        {
          "The Great Gatsby" => 28,
          "The Lord of the Rings" => 20,
          "White Fang" => 9,
        }
      )
    end
  end

  context "with keywords" do
    let(:inventory_notes) {
      [
        "gatsby",
        "gatsby",
        "Fang",
        "rings",
        "lord",
        "fang"
      ]
    }

    it "returns the correct list" do
      expect(replenish_list).to eq(
        {
          "The Great Gatsby" => 28,
          "The Lord of the Rings" => 18,
          "White Fang" => 8,
        }
      )
    end
  end

  context "with abbreviated book names" do
    let(:inventory_notes) {
      [
        "tgg",
        "tgg",
        "wf",
        "tlotr",
        "tlotr",
        "wf"
      ]
    }

    it "returns the correct list" do
      expect(replenish_list).to eq(
        {
          "The Great Gatsby" => 28,
          "The Lord of the Rings" => 18,
          "White Fang" => 8,
        }
      )
    end
  end

  context "with stack of books" do
    let(:inventory_notes) {
      [
        "The Great Gatsby x4",
        "White Fang x2",
        "gatsby",
        "Fang",
        "rings x5",
        "tlotr",
        "fang",
        "tlotr x2"
      ]
    }

    it "returns the correct list" do
      expect(replenish_list).to eq(
        {
          "The Great Gatsby" => 25,
          "The Lord of the Rings" => 12,
          "White Fang" => 6,
        }
      )
    end
  end

  context "when the inventory notes have books no longer in the catalog" do
    let(:inventory_notes) {
      [
        "The Great Gatsby",
        "The Great Gatsby",
        "White Fang",
        "Unexpected book",
      ]
    }

    it "the list ignores them" do
      expect(replenish_list).to eq(
        {
          "The Great Gatsby" => 28,
          "The Lord of the Rings" => 20,
          "White Fang" => 9,
        }
      )
    end
  end

  context "when the inventory notes is empty" do
    let(:inventory_notes) { [] }

    it "returns the full catalog" do
      expect(replenish_list).to eq(catalog)
    end
  end

  context "when the catalog is empty" do
    let(:catalog) { {} }
    let(:inventory_notes) {
      [
        "The Great Gatsby",
      ]
    }

    it "returns an empty list" do
      expect(replenish_list).to eq({})
    end
  end

  context "when the inventory notes has more books than the catalog" do
    let(:catalog) {
      {
        "The Great Gatsby" => 30,
      }
    }

    let(:inventory_notes) {
      [
        "The Great Gatsby x31",
      ]
    }

    it "is not necessary to replenish this book" do
      expect(replenish_list).to eq({})
    end
  end
end
