class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :ticket_type_id
      t.string :name
      t.string :address
      t.string :phone
      t.integer :count

      t.timestamps
    end
  end
end
