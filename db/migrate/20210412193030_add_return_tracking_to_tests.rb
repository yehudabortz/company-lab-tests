class AddReturnTrackingToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :return_tracking, :string
  end
end
