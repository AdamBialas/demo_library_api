class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, :limit => 128
      t.binary :cover
      t.jsonb :data, null: false, default: "{}"
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
