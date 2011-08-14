require "subelsky_power_tools"

module SubelskyPowerTools::Environment
  extend self

  def extract(*keys)
    keys.map! { |k| k.upcase.to_s }
    msg = "Must specify #{keys.join(", ")}"

    keys.inject([]) do |total,key|
      fail msg if ENV[key].to_s.strip.empty?
      total << ENV[key]
    end
  end
end
