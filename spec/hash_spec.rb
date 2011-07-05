require "spec_helper"
require "subelsky_power_tools/ext/hash"

describe Hash do
  let(:hash) { Hash.new(:a => 1, :b => 2, :c => 3) }

  it "should exclude given keys" do
    hash.except(:a).should == { :b => 2, :c => 3 } 
  end

  it "should perform destructive exceptions" do
    subject.except!(:c)
    subject.should == { :a => 1, :b => 2 }
  end
end
