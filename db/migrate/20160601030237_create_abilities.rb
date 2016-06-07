class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :category
      t.string :name

      t.timestamps null: false
    end
  end
end
