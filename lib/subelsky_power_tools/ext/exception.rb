# https://github.com/rubyworks/facets/blob/master/lib/core/facets/exception/detail.rb
class Exception

  # Pretty string output of exception/error
  # object useful for helpful debug messages.
  #
  # Input:
  # The Exception/StandardError object
  #
  # Output:
  # The pretty printed string
  #
  # CREDIT: George Moschovitis

  # @return [String] long description of the error including backtrace
  def detail
    return %{#{self.class.name}: #{message}\n#{backtrace.join("\n  ")}\n  LOGGED FROM: #{caller[0]}}
  end

  # @return [String] exception class and message, useful for logging
  def summary
    "#{self.class.name}: #{message}"
  end
end
