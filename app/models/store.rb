class Store < ApplicationRecord
  serialize :mapping_schema, Hash
  serialize :root_keys, Array

  enum format_response: {json: 1, xml: 2}

  def uid
    "#{id}-#{name.parameterize}"
  end
end
