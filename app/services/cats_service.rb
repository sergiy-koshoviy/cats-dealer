class CatsService < BaseService
  def self.search(params)
    execute_step(::CatsServices::Search.new(params))
  end
end
