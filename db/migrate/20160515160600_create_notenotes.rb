class CreateNotenotes < ActiveRecord::Migration
  def change
    create_table :notenotes do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
