module GetsTimeout
  @@gets_thread
  @@timeout_thread

  def self.gets_func
    value = gets
    @@timeout_thread.kill
    value
  end

  def self.timeout(s)
    sleep s
    if @@gets_thread.status == "sleep"
      @@gets_thread.kill
    else
      nil
    end
  end

  def self.gets_timeout(s)
    @@gets_thread    = Thread.new { gets_func }
    @@timeout_thread = Thread.new { timeout s }

    @@gets_thread.value
  end
end

value = GetsTimeout.gets_timeout(5) || "default"


puts "And finally, value = #{value}"
