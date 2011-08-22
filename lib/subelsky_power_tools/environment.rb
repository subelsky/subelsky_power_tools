require "subelsky_power_tools"

module SubelskyPowerTools::Environment
  extend self

  def extract!(*keys)
    get_keys(keys,true)
  end

  def extract(*keys)
    get_keys(keys,false)
  end
  
  private

  def get_keys(keys,raise_error_if_blank)
    keys.map! { |k| k.upcase.to_s }
    msg = "Must specify #{keys.join(", ")}"

    keys.inject([]) do |total,key|
      raise msg if raise_error_if_blank && ENV[key].to_s.strip.empty?
      total << ENV[key]
    end
  end
end
