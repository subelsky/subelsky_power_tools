require "subelsky_power_tools"

module SubelskyPowerTools::Environment
  extend self

  def enforce_variables(*vals)
    msg = "Must specify #{vals.map(&:upcase).join(", ")}"

    vals.each do |val|
      fail msg if ENV[val].to_s.strip.empty?
    end
  end
end
