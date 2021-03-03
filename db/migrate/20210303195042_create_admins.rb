class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
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
