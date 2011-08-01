# API inspired by http://blog.codefront.net/2008/01/14/retrying-code-blocks-in-ruby-on-exceptions-whatever/

module Kernel
  def retryable(options = {})
    opts = { :tries => 1, :on => [StandardError] }.merge(options)
    tries = opts[:tries]

    exceptions = opts[:on]
    count = 0
    sleep_seconds = opts[:sleep] || 0

    begin
      count += 1
      yield
    rescue *exceptions => e
      if count < tries
        Kernel.sleep(sleep_seconds)
        retry
      else
        raise e
      end
    end
  end
end
