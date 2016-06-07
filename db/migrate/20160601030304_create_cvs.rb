class CreateCvs < ActiveRecord::Migration
  def change
    create_table :cvs do |t|
      t.references :ability, index: true, foreign_key: true
      t.references :retire, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
