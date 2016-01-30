class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.integer :production_id, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
