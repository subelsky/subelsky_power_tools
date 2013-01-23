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

  its(:to_s) { should eq("Widget 50") }
end
