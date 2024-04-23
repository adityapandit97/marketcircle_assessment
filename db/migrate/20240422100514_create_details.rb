class CreateDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :details do |t|
      t.string :email
      t.integer :age
      t.string :phone
      t.string :title
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
