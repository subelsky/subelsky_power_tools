require "spec_helper"
require "subelsky_power_tools/ext/hash"

describe Hash do

  let(:h) do
    { :a => 1, :b => 2, :c => 3 }
  end

  it "should except given keys" do
    expect(h.except(:a)).to eq({ :b => 2, :c => 3 })
    expect(h.except(:a,:c)).to eq({ :b => 2 })
  end

  it "should perform destructive exceptions" do
    expect(h.except!(:c)).to eq({ :c => 3 })
    expect(h).to eq({ :a => 1, :b => 2 })
    h.except!(:a,:b)
    expect(h).to be_empty
  end

  it "should include given keys only" do
    expect(h.only(:a,:b)).to eq({ :a => 1, :b => 2 })
  end

  it "should perform destructive inclusion" do
    expect(h.only!(:c)).to eq({ :a => 1, :b => 2})
    expect(h).to eq({ :c => 3 })
  end
end
