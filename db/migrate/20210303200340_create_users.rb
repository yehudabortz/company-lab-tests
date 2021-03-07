class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.datetime :birthdate
      t.string :gender
      t.string :email
      t.string :dr_email
      t.string :phone

      t.boolean :is_customer, :default => false
      t.boolean :lab_super_admin, :default => false
      t.boolean :belongs_to_lab, :default => false
      t.boolean :belongs_to_company, :default => false
      t.boolean :super_admin, :default => false
      t.boolean :can_edit, :default => false
      
      t.integer :lab_id
      t.integer :company_id

      t.timestamps
    end
  end
end
