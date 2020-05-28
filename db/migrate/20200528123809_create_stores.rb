class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.string :api_url, null: false
      t.integer :format_response, null: false
      t.text :mapping_schema, null: false
      t.text :root_keys, array: true

      t.timestamps
    end
  end
end
