require "spec_helper.rb"

describe Modern_dice do
  it "has an array of strings" do
    expect(subject.dice[0]).to be_a String
  end
end
