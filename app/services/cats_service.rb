class CatsService < BaseService
  def self.search(params)
    execute_step(::CatsServices::Search.new(params))
  end

  def self.all
    redis = Redis.new

    Store.all.inject([]) do |collection, store|
      collection | JSON.parse(redis.get(store.uid))
    end
  end
end
