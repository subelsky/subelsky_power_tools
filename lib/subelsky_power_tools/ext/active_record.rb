class ActiveRecord::Base
  def to_s
    "#{self.class} #{self[:id]}"
  end
end
