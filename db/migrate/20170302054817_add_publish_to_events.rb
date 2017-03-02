class AddPublishToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :publish, :boolean, :default => false
  end
end
