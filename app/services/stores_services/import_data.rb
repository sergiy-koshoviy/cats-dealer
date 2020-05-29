module StoresServices
  class ImportData < StoresService
    class << self
      def call
        Store.all.each do |store|
          redis.set(store.uid, adapt_data(store))
        end
      end
      
      private

      def redis
        @redis ||= Redis.new
      end

      def adapt_data(store)
        StoresAdapter.call(store).to_json
      end
    end
  end
end
