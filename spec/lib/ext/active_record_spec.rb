require "spec_helper"

module ActiveRecord
  class Base
    def [](k)
      return 50 if k == :id
    end
  end
end

require "subelsky_power_tools/ext/active_record"

describe ActiveRecord::Base do
  Widget = Class.new(ActiveRecord::Base)
  subject { Widget.new }

  specify { expect(subject.to_s).to eq("Widget 50") }
end
