class CheckinJob < ApplicationJob
  queue_as :default

  HOST = "d3redis.hackeneering.com"
  CHANNEL = "BloomPartyOut"
  READ_TYPE = "BLOOM_NFC_TAG_READ"

  def initialize(*args)
    super(*args)
    config = {
      host: HOST
    }
    @redis = Redis.new config
  end

  def perform(*args)
    Rails.logger.info '[CHECKIN] initializing job'
    

    @redis.psubscribe CHANNEL do |on|
      on.pmessage do |pattern, event, data|
        Rails.logger.info '[CHECKIN] new message'
        payload = JSON.parse(data)
        type = payload["c"]

        if type == READ_TYPE then
          tag = payload["p"][1]
          sequence = payload["sq"]

          Rails.logger.info '[CHECKIN] tag: ' + tag
          Rails.logger.info '[CHECKIN] sequence: ' + sequence

          Checkin.create_from_tag(tag, sequence)
        end
      end
    end

  rescue Redis::CannotConnectError => e
    Rails.logger.error '[CHECKIN] connection failed'
  rescue StandardError => e
    Rails.logger.error '[CHECKIN] unknown error'
    Rails.logger.error e
  end
end
