class AddIndexToPublishersTin < ActiveRecord::Migration[8.0]
  def change
    add_index :publishers, :TIN, unique: true
  end
end
