class AddPreferredMetricsToUser < ActiveRecord::Migration
  def change
    add_column :users, :preferred_metrics, :text
  end
end
