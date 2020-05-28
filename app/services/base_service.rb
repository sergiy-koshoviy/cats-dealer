class BaseService
  attr_accessor :result, :ok, :errors

  def initialize(*)
    @result = nil
    @ok     = true
    @errors = []
  end

  def self.execute_step(step)
    step.call
  rescue => e
    step.ok = false
    step.errors << e

    Rails.logger.info "ERROR: #{step.errors}"
  ensure
    return step
  end

  alias_method :ok?, :ok
end
