class AddProductionIDtoCsv < ActiveRecord::Migration
  def change
    change_table :csv_inputs do |t|
      t.belongs_to :production, index:true
    end
  end
end
