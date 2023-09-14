class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :first_name, :limit => 32
      t.string :last_name, :limit => 32
      t.string :genre

      t.timestamps
    end
  end
end
