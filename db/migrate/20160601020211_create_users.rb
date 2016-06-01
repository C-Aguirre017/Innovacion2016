class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :sex
      t.datetime :birthday
      t.string :city
      t.string :commune
      t.string :state
      t.text :linkedin

      t.timestamps null: false
    end
  end
end
