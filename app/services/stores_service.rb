class StoresService < BaseService
  def self.parse_response(data, format, root_keys)
    execute_step(::StoresServices::ParseResponse.new(data, format, root_keys))
  end

  def self.import_data
    execute_step(::StoresServices::ImportData)
  end
end
