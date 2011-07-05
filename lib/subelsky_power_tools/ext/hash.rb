# https://github.com/rubyworks/facets/blob/master/lib/core/facets/hash/except.rb
# https://github.com/rubyworks/facets/blob/master/lib/core/facets/hash/slice.rb

class Hash

  # Returns a new hash less the given keys.
  def except(*less_keys)
    hash = dup
    less_keys.each{ |k| hash.delete(k) }
    hash
  end

  # Replaces hash with new hash less the given keys.
  # This returns the hash of keys removed.
  #
  #   h = {:a=>1, :b=>2, :c=>3}
  #   h.except!(:a)  #=> {:a=>1}
  #   h              #=> {:b=>2,:c=>3}
  #
  # Returns a Hash of the removed pairs.
  def except!(*rejected)
    removed = {}
    rejected.each{ |k| removed[k] = delete(k) }
    removed
  end

  # Returns a new hash with only the given keys.
  #
  #   h = {:a=>1, :b=>2}
  #   h.only(:a)  #=> {:a=>1}
  #
  def only(*keep_keys)
    hash = {}
    keep_keys.each do |key|
      hash[key] = fetch(key)
    end
    hash
  end

  # Replaces hash with a new hash having only the given keys.
  # This return the hash of keys removed.
  #
  #   h = {:a=>1, :b=>2}
  #   h.only!(:a)  #=> {:b=>2}
  #   h             #=> {:a=>1}
  #
  # Returns a Hash of the removed pairs.
  def only!(*keep_keys)
    rejected = keys - keep_keys
    removed = {}
    rejected.each{ |k| removed[k] = delete(k) }
    removed
  end
end
