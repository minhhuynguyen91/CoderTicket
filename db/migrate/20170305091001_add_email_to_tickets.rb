class AddEmailToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :email, :string
  end
end
