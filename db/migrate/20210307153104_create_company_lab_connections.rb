class CreateCompanyLabConnections < ActiveRecord::Migration[6.1]
  def change
    create_table :company_lab_connections do |t|
      t.integer :company_id
      t.integer :lab_id
      
      t.boolean :pending, :default => false
      t.boolean :rejected, :default => false
      t.boolean :accepted, :default => false
      t.boolean :completed, :default => false

      t.timestamps
    end
  end
end
