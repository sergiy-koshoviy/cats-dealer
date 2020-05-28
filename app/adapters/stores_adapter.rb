# frozen_string_literal: true

class StoresAdapter
  class << self
    def fetch
      Store.all.inject([]) do |collection, store|
        response_body = response(store.api_url).body
        parsed_body   = parse_body(response_body, store.format_response, store.root_keys)
        fetched_data  = map_data(store.mapping_schema, parsed_body)

        collection | fetched_data
      end
    end

    private

    def response(url)
      RestClient.get(url)
    end

    def parse_body(body, format, root_keys)
      ::StoresService.parse_response(body, format, root_keys).result
    end

    def map_data(schema, data)
      data.map do |item|
        {
          breed:    item[schema[:breed]],
          location: item[schema[:location]],
          price:    item[schema[:price]].to_i,
          image:    item[schema[:image]]
        }
      end
    end
  end
end
