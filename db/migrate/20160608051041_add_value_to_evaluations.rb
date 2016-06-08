class AddValueToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :value, :integer
  end
end
