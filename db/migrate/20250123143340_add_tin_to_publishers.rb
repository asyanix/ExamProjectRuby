class AddTinToPublishers < ActiveRecord::Migration[8.0]
  def change
    add_column :publishers, :TIN, :integer
  end
end
