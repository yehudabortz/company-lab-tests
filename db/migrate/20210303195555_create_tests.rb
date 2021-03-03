class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.integer :unique_test_id
      t.integer :mma
      t.integer :creatinine
      t.integer :final_result
      t.boolean :verified
      t.integer :company_id
      t.integer :lab_id
      t.integer :user_id

      t.timestamps
    end
  end
end
