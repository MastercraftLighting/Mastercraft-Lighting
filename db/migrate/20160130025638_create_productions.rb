class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.string :name, null: false
      t.date :date
      t.integer :designer_id
      t.integer :master_electrician_id
      t.timestamps null: false
    end
  end
end
