class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :user, index: true, foreign_key: true
      t.references :retire, index: true, foreign_key: true
      t.boolean :is_valid
      t.boolean :read

      t.timestamps null: false
    end
  end
end
