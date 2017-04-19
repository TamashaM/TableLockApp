class AddParamsStatusTransactionIdPurchasedAtToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :notification_params, :text
    add_column :reservations, :status, :string
    add_column :reservations, :transaction_id, :string
    add_column :reservations, :purchased_at, :datetime
  end
end
