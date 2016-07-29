class CreateBasicTables < ActiveRecord::Migration
  def change
    create_table :projects, :force => true do |t|
      t.string :name
      t.timestamps :null => false
    end
    add_index :projects, :name
    
    create_table :configs, :force => true  do |t|
      t.references :project
      t.string :metric_name
      t.text :options
      t.timestamps :null => false
    end
    add_index :configs, :project_id

    create_table :metric_samples, :force => true  do |t|
      t.references :project
      t.string :metric_name
      t.text :raw_data
      t.timestamps :null => false
    end
    add_index :metric_samples, :project_id
    add_index :metric_samples, [:project_id, :metric_name]
  end
end
