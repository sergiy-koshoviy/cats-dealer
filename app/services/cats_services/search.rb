module CatsServices
  class Search < CatsService
    attr_reader :cats_breed, :location

    def initialize(params)
      super

      @result     = {}
      @cats_breed = params.fetch(:cats_breed)
      @location   = params.fetch(:location)
    end

    def call
      fetch_data_from_external_api
      select_cats
      find_lower_price

      self.result = {cats: @selected_cats, lower_price: @lower_price}
    end

    private

    def fetch_data_from_external_api
      @response ||= ::StoresAdapter.fetch
    end

    def select_cats
      @selected_cats = @response.select do |list|
        list[:location] == location && list[:breed] == cats_breed
      end

      @selected_cats.sort_by! { |cat| cat[:price] }
    end

    def find_lower_price
      @lower_price = @selected_cats.first[:price] if @selected_cats.present?
    end
  end
end
