require 'json'

class Thing
  attr_reader :status
  @@states = [:open, :ready, :in_progress, :done]

  @@states.each do |status|
    define_method status do
      @status = status
    end
  end

  def self.states
    @@states
  end
end

t = Thing.new
t.done

payload = JSON.generate({ status: "open" })
puts payload

res = JSON.parse(payload)
puts res

t.public_send(res["status"]) if Thing.states.include? res["status"].to_sym
puts t.status
