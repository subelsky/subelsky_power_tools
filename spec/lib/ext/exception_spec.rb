require "spec_helper"
require "subelsky_power_tools/ext/exception"

describe Exception do
  let(:exception) do
    StandardError.new("something bad happened")
  end

  it "reports details" do
    begin
      raise exception
    rescue StandardError => e
      expect(e.detail).to match(/StandardError: something bad happened\n/)
    end
  end

  it "reports a summary" do
    expect(exception.summary).to eq("StandardError: something bad happened")
  end
end
