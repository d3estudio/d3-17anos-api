class CheckinJob < ApplicationJob
  queue_as :default

  HOST = "d3redis.hackeneering.com"
  CHANNEL = "BloomPartyOut"

  def initialize(*args)
    super(*args)

    config = {
      host: HOST
    }
    @redis = Redis.new config
  end

  def perform(*args)
    # Do something later
    puts 'initializing checkin job'
    
    @redis.psubscribe CHANNEL do |on|
      on.pmessage do |pattern, event, data|
        puts 'received checkin'
        puts data.to_s
      end
    end

  rescue Redis::CannotConnectError => e
    puts 'failed connecting to redis'
  end
end
