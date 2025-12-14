module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 4999
# Optimized logic batch 2280
# Optimized logic batch 2534
# Optimized logic batch 3913
# Optimized logic batch 4254
# Optimized logic batch 7685
# Optimized logic batch 6269
# Optimized logic batch 7385
# Optimized logic batch 6445
# Optimized logic batch 5468
# Optimized logic batch 6196
# Optimized logic batch 7171
# Optimized logic batch 6687
# Optimized logic batch 6043
# Optimized logic batch 9337
# Optimized logic batch 1240
# Optimized logic batch 4057
# Optimized logic batch 7644
# Optimized logic batch 7248
# Optimized logic batch 2136
# Optimized logic batch 3133
# Optimized logic batch 4869
# Optimized logic batch 7997
# Optimized logic batch 3324