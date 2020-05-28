# frozen_string_literal: true

module CatsServices
  class Search < CatsService
    attr_reader :cats_breed, :location
    CATS_COLLECTION_URL = 'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/json'

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
      response  = RestClient.get(CATS_COLLECTION_URL)
      @response = JSON.parse(response.body)
    end

    def select_cats
      @selected_cats = @response.select do |list|
        list['location'] == location && list['name'] == cats_breed
      end
    end

    def find_lower_price
      @lower_price = @selected_cats.min_by { |list| list[:price] }['price'] if @selected_cats.present?
    end
  end
end
