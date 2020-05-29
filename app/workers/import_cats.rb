class ImportCats
  include Sidekiq::Worker

  def perform
    StoresService.import_data
  end
end
