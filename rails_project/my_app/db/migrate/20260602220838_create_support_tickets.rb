class CreateSupportTickets < ActiveRecord::Migration[8.1]
  def change
    create_table :support_tickets do |t|
      t.string :customer_name
      t.text :issue_description
      t.string :status

      t.timestamps
    end
  end
end
