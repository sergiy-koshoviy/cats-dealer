module StoresServices
  class ParseResponse < StoresService
    attr_reader :data, :format, :root_keys

    def initialize(data, format, root_keys)
      super

      @data = data
      @format = format
      @root_keys = root_keys
    end

    def call
      return unless Store.format_responses.keys.include?(format)

      self.result = send("#{format}_parser")
      self.result = dig_data_by_root_keys if root_keys.present?
    end

    private

    def json_parser
      JSON.parse(data)
    end

    def xml_parser
      Hash.from_xml(data)
    end

    def dig_data_by_root_keys
      root_keys.inject(result) { |data, key| data[key] }
    end
  end
end
