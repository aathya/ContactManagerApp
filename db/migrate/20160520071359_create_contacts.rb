class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
    	t.string :name,               null: false, default: "" , :limit => 20
    	t.string :phone,				null: false, default: "" , :limit => 10
    	t.string :address,               null: false, default: "" , :limit => 50
      t.references :user, index: true , foreign_key: true
     

      t.timestamps null: false
    end
    add_index :contacts, :name,                unique: false 
    add_index :contacts, :phone,                unique: false
    add_index :contacts, :address,                unique: false

  end
end
