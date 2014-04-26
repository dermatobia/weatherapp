class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
    	t.float :temp_c
    	t.float :temp_f
    	t.string :status
    	t.belongs_to :city
    end
  end
end