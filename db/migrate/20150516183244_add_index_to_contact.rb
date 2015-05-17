class AddIndexToContact < ActiveRecord::Migration
  def change
    change_table(:contacts) do |table|
      table.index :name
      table.index :telephone
      table.index :address
    end
  end
end
