class CreateRetires < ActiveRecord::Migration
  def change
    create_table :retires do |t|
      t.references :user, index: true, foreign_key: true
      t.string :telephone

      t.timestamps null: false
    end
  end
end
