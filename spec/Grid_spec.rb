require 'spec_helper'

describe Grid do
  it "requests the dice array" do
    dice_bag = double(:dice_bag, dice: [])
    grid = Grid.new(dice_bag)

    expect(dice_bag).to have_received(:dice)
  end

  it "returns single character as a string" do
    dice_bag = double(:dice_bag, dice: ["AA", "AA"])
    grid = Grid.new(dice_bag)

    expect(grid.select_die(0)).to eq("A")
  end
end
