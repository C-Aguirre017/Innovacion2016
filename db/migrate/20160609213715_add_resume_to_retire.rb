class AddResumeToRetire < ActiveRecord::Migration
  def change
    add_column :retires, :resume, :text
  end
end
